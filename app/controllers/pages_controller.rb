class PagesController < ApplicationController
	before_filter :require_admin, :only => :admin

  def home
		@title = "Home"
		@events = Event.all(:conditions => ["date > ?", Date.today])
		@contributions = Contribution.paginate :page => params[:page], :per_page => 20
  end

  def help
		@title = "Help"
  end

  def about
		@title = "About"
  end

  def admin
		@title = "Admin"
  end

end
