class AdminController < ApplicationController

  before_action :authenticate_user!
  before_action :check_rank

  def show

    @Users = Users.all

  end

  private

  def check_rank

    if current_user.rank_id < 1

      redirect_to root_path

    end

  end

end
