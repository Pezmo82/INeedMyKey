class Admin::Locations::AuthoriseRetrievalsController < ApplicationController

    def new
        @authorise_retrievals = Authorise.new
    end

    def show
    end

    def authorise_retrievals
        @location = Location.find(params[:id])
        @keys = Key.where("location_id = :location_id", {location_id: params[:id]})

        @keys.each do | key |
            if key.auth_code = params[admin_locations_authorise_path][:authcode]
                @storage = Storage.where("key_id = :key_id AND location_id = :location_id", {key_id: key.id, location_id: params[:id]}).order(is_stored: :asc).first
                @storage.is_stored = false
                @storage.was_retrieved = true
                @retrieval.location_id = nil
                @retrieval.was_retrieved = true
                key.auth_code = nil
                key.save

            else
                flash[:alert] = "Something went wrong"
            end
        end

        redirect_to admin_location_path

    end

end
