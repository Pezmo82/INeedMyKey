class CommentsController < ApplicationController

  def new

    @comment = Comment.new

  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.valid?
      # TODO send message here
      flash[:notice] = "Message sent! Thank you for contacting us."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end