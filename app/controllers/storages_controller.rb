class StoragesController < ApplicationController

  def new

    @keys = current_user.keys.all

    @storage = Storage.new

  end

  def create

#    raise params.inspect

    @storage = Storage.new
    @storage.location_id = pick_location
    @storage.key_id = params[:storage][:key_id]

    if @storage.save

      flash['notice'] = "Storage information has been sent to you."
      redirect_to root_path

    else

      flash['error'] = "Key storage has failed."
      render new

    end

  end

  private

  def pick_location

    @locations = Location.all

    @location = Location.order("RAND()").first

    return @location.id

  end

end
