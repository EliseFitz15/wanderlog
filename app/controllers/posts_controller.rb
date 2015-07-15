class PostsController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    @trip = Trip.find(params[:trip_id])
    @post.trip = @trip

    if @post.save
      flash[:notice] = "Post added to your trip!"
      redirect_to trip_path(params[:trip_id])
    else
      flash.now[:alert] = @post.errors.full_messages.join(". ")
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:headline, :content, :trip_id)
  end
end
