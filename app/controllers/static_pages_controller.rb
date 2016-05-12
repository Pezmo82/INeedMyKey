class StaticPagesController < ApplicationController

	before_action :after_sign_in

	def after_sign_in
	    if user_signed_in? && current_user.rank_id > 0
	        redirect_to admin_index_path
	    end
	end

  	def home
  	end

end
