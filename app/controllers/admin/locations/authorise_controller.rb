class Admin::Locations::AuthoriseController < ApplicationController

  def new

    @authorise = Authorise.new

  end

  def show

      @location = Location.find(params[:id])

  end

end
