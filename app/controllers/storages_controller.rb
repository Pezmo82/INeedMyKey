class StoragesController < ApplicationController
    
    def new

        @keys = current_user.keys.where("location_id IS NULL")

        @storage = Storage.new

    end

    def create

        @storage = Storage.new

        location_id = pick_location

        @storage.location_id = location_id
        @key = Key.find_by id: params[:storage][:key_id]
        @storage.key_id = @key.id

        @key.auth_code = generateAuthcode
        @key.location_id = location_id

        @key.save


        if @storage.save
            # send the user a text message
            send_storage_sms(current_user.mobile_number, @storage, @key.auth_code)

            # put a success flash message on the page and redirect
            flash['notice'] = "Storage information has been sent to you."
            redirect_to root_path
        else
            flash['error'] = "Key storage has failed."
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

        def pick_location

            @locations = Location.all

            @location = Location.order("RAND()").limit(1).first

            return @location.id

        end

    end
