class UsersController < ApplicationController

	before_action :authenticate_user!

	def change_email
	end

	def change_email_do

		new_email = params[account_change_email_path][:new_email]
		new_email_repeat = params[account_change_email_path][:new_email_repeat]

		if params[account_change_email_path][:current_email] == current_user.email

			if new_email == new_email_repeat

				current_user.email = new_email

				current_user.save

			else

				flash[:alert] = "New email address fields do not match."

			end

		else

			flash[:alert] = "Current Email Address Incorrect."

		end

		redirect_to account_path

	end

end
