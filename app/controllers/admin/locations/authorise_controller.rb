class Admin::Locations::AuthoriseController < ApplicationController

	def new
		@authorise = Authorise.new
	end

  	def show
		@location = Location.find(params[:id])
		@storages = Storage.where("location_id = :location_id", {location_id: params[:id]})
		@storages.each do | storage |

        # Code for testing whether authorisation code entered matches
        # any records in storage table for the specified location
    	end
  	end

end
