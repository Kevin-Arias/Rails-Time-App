class UsersController < ApplicationController
	#before_action :require_login

	def index
		@user = User.new
		@user.login_check = true
	end

	def new 
		@user = User.new
	end

	def create
		user = User.new(user_params)
		user.check_all = true
		if user.save
			session[:user_id] = user.id
			redirect_to "/users/#{user.id}"
		else
			flash[:errors] = user.errors.full_messages
			redirect_to "/users/new"
		end
		
	end

	def show 
		
		@user = User.find(params[:id])
		if !session[:user_id] || @user.id!=session[:user_id]
			flash[:errors] = ["You must log in first"]
			redirect_to :root
		end
	end

	def edit
		@user = User.find(params[:id])
		if !session[:user_id] || @user.id!=session[:user_id]
			flash[:errors] = ["You must log in first"]
			redirect_to :root
		end
	end

	def update
		user = User.find(params[:id])
		user.edit_check = true;
		if user.update(user_params)
			redirect_to "/users/#{user.id}"
		else
			flash[:errors] = user.errors.full_messages
			redirect_to "/users/#{user.id}/edit"
		end
	end


private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end
