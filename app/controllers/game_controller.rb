class GameController < ApplicationController

	def start
		@user = User.find(session[:user_id]);
		@current_points = current_user.points;
		
		@user.update_attributes( :points => @current_points+50);
		
			redirect_to :controller => "pages", :action => "profile";
	end
end
