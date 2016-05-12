class Admin::UsersController < ApplicationController

	before_action :authenticate_user!
	before_action :check_rank

	def index
		@Users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
	    
	  	if @user.update_attributes(user_params)
	    	flash[:notice] = "User rank updated."
	    	redirect_to admin_users_path
	  	end
	end

end
