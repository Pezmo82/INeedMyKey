class AdminController < ApplicationController
	
  	before_action :check_rank, :authenticate_user!

  	def index
 		@keys = Key.all
 		@locations = Location.all
 	end

end
