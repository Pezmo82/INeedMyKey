class Admin::KeysController < ApplicationController

  	before_action :authenticate_user!
  	before_action :check_rank

  	def index
    	@Keys = Key.all
  	end

    def edit
        @key = Key.find(params[:id])
    end

    def update
        @key = Key.find(params[:id])
        
        if @key.update_attributes(key_params)
            flash[:notice] = "Key Location Updated."
            redirect_to admin_keys_path
        end
    end

        private

            def key_params
                params.require(:key).permit(:location)
            end
end
