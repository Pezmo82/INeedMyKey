class RetrievalsController < ApplicationController

    before_action :authenticate_user!

    def new
        @keys = current_user.keys.where("location_id IS NOT NULL")

        if @keys == "IS NULL"
            flash['notice'] = "No keys stored."
            redirect_to root_path
        end
        @retrieval = Retrieval.new
    end

    def create
        @retrieval = Retrieval.new
        location_id = find_location
        @key = Key.find_by id: params[:retrieval][:key_id]
        @retrieval.key_id = @key.id
        @retrieval.location_id = @key.location_id
        @retrieval.was_retrieved = false
        @storage.is_stored = false
        @storage.to_collect = true
        @storage.save
        @key.auth_code = generateAuthcode
        @key.save

        if @retrieval.save
            # send the user a text message
            send_retrieval_sms(current_user.mobile_number, @retrieval, @key.auth_code)
            # put a success flash message on the page and redirect
            flash['notice'] = "Retrieval information has been sent to you."
            redirect_to root_path
        
        else
            flash['error'] = "Key retrieval has failed."
            render new

        end

    end

    	private

		    def generateAuthcode
		    	psrn = Random.new
				genAuth = psrn.rand(10000..99999)

		      	return genAuth
		    end

        private

            def find_location

                @keys = Key.all
                @key = Key.find_by id: :location_id

                return @retrieval.location_id

            end

        private

            def retrieval_params
                params.require(:retrieval).permit(:location_id, :location_name, :location_address_line_1, :location_address_line_2, :location_parish)
            end

end
