class Admin::Locations::RetrievalAuthoriseController < ApplicationController

    def new
        @authorise_retrievals = Authorise.new
    end

    def show
    end

    def retrieval_authorise
        @location = Location.find(params[:id])
        @keys = Key.where("auth_code = :auth_code", {auth_code: params[admin_locations_retrieval_authorise_path][:authcode]})

        @keys.each do | key |
            if key.auth_code = params[admin_locations_retrieval_authorise_path][:authcode]
                @storage = Storage.where("key_id = :key_id AND location_id = :location_id", {key_id: key.id, location_id: params[:id]}).order(is_stored: :asc).first
                @storage.to_collect = false
                @storage.was_retrieved = true
                @retrieval = Retrieval.where("key_id = :key_id AND location_id = :location_id", {key_id: key.id, location_id: params[:id]}).order(was_retrieved: :asc).first
                @retrieval.was_retrieved = true
                key.auth_code = nil
                key.location_id = nil
                key.save
                @storage.save
                @retrieval.save

                flash[:alert] = "key #{key.id}"

            else
                flash[:alert] = "Something went wrong"
            end
        end

        redirect_to admin_location_path

    end

end
