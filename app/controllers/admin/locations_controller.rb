class Admin::LocationsController < ApplicationController

  before_action :authenticate_user!
  before_action :check_rank

  def index

    @Locations = Location.all

  end

  def new

    @location = Location.new

  end

  def create

    @location = Location.new(location_params)

    if @location.save

      flash[:notice] = "Location lodged."
      redirect_to admin_locations_path

    else

      render :new

    end
  end

	def delete

	end

  def update

    @location = Location.find_by(location_id)

    if @location.save

      flash[:notice] = "Location amended."
      redirect_to admin_locations_path

    else

      render :new

    end
  end

  private

  def location_params

    params.require(:location).permit(:name, :address_line_1, :address_line_2, :parish, :post_code, :capacity)

  end

end
