class AdminController < ApplicationController

  before_action :authenticate_user!
  before_action :check_rank

  def show

    @Users = Users.all

  end

end
