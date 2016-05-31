class StoragesController < ApplicationController

  def new

    @keys = current_user.keys.all

    @storage = Storage.new

  end

  def create

    @storage = Storage.new
    @storage.location_id = pick_location
    @key = Key.find_by id: params[:storage][:key_id]
    @storage.key_id = @key.id

    @key.auth_code = generateAuthcode

    @key.save


    if @storage.save

      flash['notice'] = "Storage information has been sent to you."
      redirect_to root_path

    else

      flash['error'] = "Key storage has failed."
      render new

    end

  end

  private

  def generateAuthcode

    i = 0

    genAuth = ""

    if i < 5

      genAuth += rand().to_s
      i += 1

    end

    return genAuth

  end

  private

  def pick_location

    @locations = Location.all

    @location = Location.order("RAND()").limit(1).first

    return @location.id

  end

end
