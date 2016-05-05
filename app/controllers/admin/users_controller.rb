class Admin::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :check_rank

  def show

    @Users = User.all

  end

end
