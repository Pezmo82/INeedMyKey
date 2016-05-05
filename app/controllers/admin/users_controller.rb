class Admin::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :check_rank

  def index

    @Users = User.all

  end

end
