class Admin::RetrievalsController < ApplicationController

    before_action :authenticate_user!
    before_action :check_rank

    def index
        @Retrievals = Retrievals.all
    end

    def edit
        key = Key.find(params[:id])

        @retreival = (Retrieval.find_by key_id: key.id)  
    end

    def update
        @retrieval = Retrieval.find(params[:id])
        
        if @retrieval.update_attributes(retrieval_params)
            flash[:notice] = "Key Location Updated."
            redirect_to admin_keys_path
        end
    end

        private

            def retrieval_params
                params.require(:retrieval).permit(:location_id)
            end
end

