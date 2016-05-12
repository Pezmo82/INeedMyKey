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
      flash[:notice] = "Location added."
      redirect_to admin_locations_path
    else
      render :new
    end
end

def destroy
    Location.find(params[:id]).destroy
    flash[:success] = "Location deleted"
    redirect_to admin_locations_path
end

def edit
  @location = Location.find(params[:id])
end

def update
   @location = Location.find(params[:id])
    
  if @location.update_attributes(location_params)
    flash[:notice] = "Location Updated."
    redirect_to admin_locations_path
  end
end

private
    def location_params
      params.require(:location).permit(:name, :address_line_1, :address_line_2, :parish, :post_code, :capacity)
    end
end
