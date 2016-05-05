class Admin::LocationsController < ApplicationController


  before_action :authenticate_user!
  before_action :check_rank

  def new

    @location = Location.new

  end

  def create
    @location = Location.new(params[:location])
      flash[:notice] = "Location lodged."
      redirect_to location_path
    else
      render :action => 'new'
    end
  end

	def delete

	end

	def show
  end

end
