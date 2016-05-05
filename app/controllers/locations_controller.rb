class LocationsController < ApplicationController

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