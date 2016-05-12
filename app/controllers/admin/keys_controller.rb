class Admin::KeysController < ApplicationController

  	before_action :authenticate_user!
  	before_action :check_rank

  	def index
    	@Keys = Key.all
  	end

end
