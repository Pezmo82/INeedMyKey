class Admin::StoragesController < ApplicationController

    before_action :authenticate_user!
    before_action :check_rank

    def index
        @Retreivals = Retreivals.all
    end

    def edit
        key = Key.find(params[:id])

        @retreival = (Retreival.find_by key_id: key.id)  
    end

    def update
        @retreival = Retreival.find(params[:id])
        
        if @retreival.update_attributes(retreival_params)
            flash[:notice] = "Key Location Updated."
            redirect_to admin_keys_path
        end
    end

        private

            def retreival_params
                params.require(:retreival).permit(:location_id)
            end
end

