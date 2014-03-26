class UserController < ApplicationController

	def show
		if current_user
			@user = current_user
		else
			flash[:notice] = "Please log in first."
			redirect_to new_user_session_path
		end
	end	
end
