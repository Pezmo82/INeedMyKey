class AdminController < ApplicationController

  	before_action :check_rank, :authenticate_user!

  	def index
 	end

end
