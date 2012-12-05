class PagesController < ApplicationController
	before_filter :require_user,  :only => [:profile, :play] 
	
    def require_user
			session[:req_uri] = request.url;
			unless current_user
					flash[:notice] = 'Please authorize first to access this page'
					redirect_to :controller => :sessions, :action => :new
			end
	end
	
	
  def main
	@title = "Main page"
  end

  def profile
	@title = "Profile"
	@played = "here will be number of games played";
  end

  def play
	@title = "Play"
	#list of games
  end

  def people
	@title = "People"
	
	@donators = Donator.all;
  end

  def about
	@title = "About"
  end
end
