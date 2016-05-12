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

	def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to admin_users_path
    end


		private
	    	def user_params
		      	params.require(:user).permit(:rank_id)
		    end

end
