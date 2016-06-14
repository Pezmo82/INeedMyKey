class RetrievalsController < ApplicationController

    before_action :authenticate_user!

    def new
        @keys = current_user.keys.all
        @retrieval = Retrieval.new
    end

    def create
        @retrieval = Retrieval.new
        @key = Key.find_by id: params[:retrieval][:key_id]
        @retrieval.key_id = @key.id
        @key.auth_code = generateAuthcode
        @key.save

        if @retrieval.save

        # send the user a text message
        send_retrieval_sms(current_user.mobile_number, @storage, @key.auth_code)

        # put a success flash message on the page and redirect
        flash['notice'] = "Retrieval information has been sent to you."
        redirect_to root_path
        
        else
            flash['error'] = "Key retrieval has failed."
            render new

        end

    end

    def edit
        @retrieval = Location.find(params[:id])
    end

    def update
        @retrieval = Location.find(params[:id])

        if @location.update_attributes(location_params)
            flash[:notice] = "Location Updated."
            redirect_to admin_locations_path
        end
    end

    	private

		    def generateAuthcode
		    	psrn = Random.new
				genAuth = psrn.rand(10000..99999)

		      	return genAuth
		    end

end
