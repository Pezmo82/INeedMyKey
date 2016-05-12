class StoragesController < ApplicationController

  def new

    @keys = current_user.keys.all

    @storage = Storage.new

  end

  def create

    @storage = Storage.new
    @storage.location_id = pick_location

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

    @location = @locations.find_by id: rand(@locations.count)

    return @location.id

  end

end
