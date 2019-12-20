class ApplicationController < ActionController::Base

	def current_user
		User.find(session[:user_id]) if session[:user_id]
	end

	def require_login
		if !session[:user_id]
			flash[:errors] = ["You must log in first"]
			redirect_to :root
		end
	end
end
