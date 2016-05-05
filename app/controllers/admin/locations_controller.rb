class Admin::LocationsController < ApplicationController


  before_action :authenticate_user!
  before_action :check_rank

end
