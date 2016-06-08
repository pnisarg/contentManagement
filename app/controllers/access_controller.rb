class AccessController < ApplicationController

	layout 'admin'
	def index
  	#display text
  	

  end

  def login
  end

  def attempt_login:
  	if params[:username].present? && params[:password].present?
  		found_user = AdminUser.where(:username => params[:username]).first
  		if found_user
  			authorized_user = found_user.authenticate(params[:password])
  		end
  		if authorized_user
  			flash[:notice] = "You are now logged in."
  			redirect_to(:action => 'index')
  		else
  			flash[:notice] = "Invalid username/password combination."
  			redirect_to(:action => 'login')
  		end
  	end
  end


  def logout
  	flash[:notice] = "Logged out"
  	redirect_to(:action => 'login')
  end



end
