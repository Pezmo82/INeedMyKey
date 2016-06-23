class Admin::StoragesController < ApplicationController

    before_action :authenticate_user!
    before_action :check_rank

    def index
        @Storages = Storages.all
        @Locations = Locations.all
    end

    def show
        @Locations = Locations.all
    end

    def edit
        @storage = Storage.find(params[:id])
        @key = @storage.key
        @location = @storage.location
    end

    def update
        @storage = Storage.find(params[:id])
        
        if @storage.update_attributes(storage_params)
            @storage.key.location_id = @storage.location_id
            @storage.key.save

            flash[:notice] = "Key Location Updated."
            redirect_to admin_keys_path
        end
    end

        private

            def storage_params
                params.require(:storage).permit(:location_id)
            end

            def location_params
                params.require(:location).permit(:location_id)
            end
end

