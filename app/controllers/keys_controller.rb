class KeysController < ApplicationController

    before_action :authenticate_user!

    def show
    end

    def new
        @key = Key.new
    end

    def create
        @key = current_user.keys.new(key_params)

        if @key.save
            flash[:notice] = 'Key added successfully'
            redirect_to root_path
        else
            render :new
        end
    end

    def delete
    end

    private
    
        def key_params
            params.require(:key).permit(:name)
        end

end
