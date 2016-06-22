class Admin::Locations::AuthoriseController < ApplicationController

	def new
		@authorise = Authorise.new
	end

	def show
	end

	def authorise
		@location = Location.find(params[:id])
		@keys = Key.where("location_id = :location_id", {location_id: params[:id]})

		@keys.each do | key |
			if key.auth_code = params[admin_locations_authorise_path][:authcode]
	    		@storage = @key.storages.first
	    		@storage.to_drop = false
	    		@storage.is_stored = true
	    		key.auth_code = nil
	    		key.save
	    		@storage.save
			else
				flash[:alert] = "Something went wrong"
			end
		end

		redirect_to admin_location_path

	end

end
