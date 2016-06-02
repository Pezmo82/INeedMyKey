class Admin::StoragesController < ApplicationController

    before_action :authenticate_user!
    before_action :check_rank

    def index
        @Storages = Storages.all
    end

    def edit
        key = Key.find(params[:id])

        @storage = (Storage.find_by key_id: key.id)  
    end

    def update
        @storage = Storage.find(params[:id])
        
        if @storage.update_attributes(storage_params)
            flash[:notice] = "Key Location Updated."
            redirect_to admin_keys_path
        end
    end

        private

            def storage_params
                params.require(:storage).permit(:location_id)
            end
end

