class RetrievalsController < ApplicationController

  def new

    @keys = current_user.keys.all

    @retrieval = Retrieval.new

  end

  def create

    @retrieval = Retrieval.new
    @retrieval.location_id = pick_location
    @key = Key.find_by id: params[:retrieval][:key_id]
    @retrieval.key_id = @key.id

    @key.auth_code = SecureRandom.base64(32)

    @key.save


    if @retrieval.save

      flash['notice'] = "Retrieval information has been sent to you."
      redirect_to root_path

    else

      flash['error'] = "Key retrieval has failed."
      render new

    end

  end

end