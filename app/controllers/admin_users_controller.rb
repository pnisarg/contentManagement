class AdminUsersController < ApplicationController
	layout 'admin'

	before_action :confirm_logged_in

	def index
		@users = AdminUser.sorted
	end

	def new
		@user = AdminUser.new
	end

	def create
		@user = AdminUser.new(user_params)
		if @user.save
			flash[:notice] = "Admin user created successfully."
			redirect_to(:action => 'index')
		else
			render('new')
		end

	end

	def edit
		@user = AdminUser.find(params[:id])
	end

	def update
		@user = AdminUser.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:notice] = "Admin user updated successfully."
			redirect_to(:action => 'index')
		else
			render('edit')
		end
	end

	def delete
		@user = AdminUser.find(params[:id])
	end

	def destroy
		user = AdminUser.find(params[:id])
		user.destroy
		flash[:notice] = "User '#{user.name}' destroyed successfully."
		redirect_to(:action => 'index')
	end
	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
	end

end

