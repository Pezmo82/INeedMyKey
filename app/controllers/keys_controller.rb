class KeysController < ApplicationController

    before_action :authenticate_user!

    def new
        @key = Key.new
    end

    def create
        @key = current_user.keys.new(key_params)

        if @key.save
            flash[:notice] = 'Key added successfully'
            redirect_to payment_path
        else
            render :new
        end
    end

    def destroy
        Key.find(params[:id]).destroy
        flash[:success] = "Key Deleted."
        redirect_to root_path
    end

        private
            def key_params
                params.require(:key).permit(:name)
            end
            
end
