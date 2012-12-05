class DonationsController < ApplicationController
  def donate
	@d_list = Donator.all
	@maximum = current_user.points;
  end
  
  
  
  def show
	@donations = Donation.all
  end
  
  
  
  def save
	
	if params[:amount] == "0"
		return redirect_to donate_path, :notice => "Minimum allowed is 1"
		Kernel::Exit();
	end
	
	if params[:amount].to_i > current_user.points
		return redirect_to donate_path, :notice => "You have not enough points"
		Kernel::Exit();
	end
	
	
  
		@don = Donation.new;
		@don.user_id = current_user.id;
		@don.donator_id = Donator.find(params[:donator_id]).id;
		@don.date = Time.now;
		@don.amount = params[:amount];
		
		if @don.save
			@cur_pts = current_user.points;
			current_user.update_attributes(:points => @cur_pts-params[:amount].to_i)
			return redirect_to donate_path, :notice => "You have successfully donated "+params[:amount]+" to " + Donator.find(params[:donator_id]).name + " Thank You!";
		else
			return redirect_to donate_path, :notice => "You error has occured!"
		end
	
  end
end
