class UsersController < ApplicationController

	before_action :authenticate_user!

	def change_email
	end

	def change_mobile
	end

	def change_email_do
		new_email = params[account_change_email_path][:new_email]
		new_email_repeat = params[account_change_email_path][:new_email_repeat]

		if params[account_change_email_path][:current_email] == current_user.email
			if new_email == new_email_repeat
				current_user.email = new_email

				if current_user.save
					flash[:alert] = "Email changed successfully"
				else
					flash[:alert] = "Something went wrong..."
				end

			else
				flash[:alert] = "New email address fields do not match."
			end

		else
			flash[:alert] = "Current Email Address Incorrect."
		end

		redirect_to account_path

	end

	def change_mobile_do
		new_mobile = params[account_change_mobile_path][:new_mobile]
		new_mobile_repeat = params[account_change_mobile_path][:new_mobile_repeat]

		if params[account_change_mobile_path][:current_mobile] == current_user.mobile_number
			if new_mobile == new_mobile_repeat
				current_user.mobile_number = new_mobile

				if current_user.save
					flash[:alert] = "Mobile Number Changed Successfully"
				else
					flash[:alert] = "Something Went Wrong..."
				end
			else
				flash[:alert] = "New Mobile Number Fields Do Not Match."
			end
		else
			flash[:alert] = "Current Mobile Number Incorrect."
		end

		redirect_to account_path
	end

end
