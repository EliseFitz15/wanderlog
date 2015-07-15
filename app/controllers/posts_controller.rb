class PostsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
    @post = Post.where(trip_id: params[:id])
  end

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

  def edit
    @trip = Trip.find(params[:trip_id])
    @post = Post.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:trip_id])
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "Your post has been updated successfully."
      redirect_to trip_path(@trip)
    else
      flash.now[:alert] = @post.errors.full_messages.join(":( ")
      render :edit
    end
  end

  def post_params
    params.require(:post).permit(:headline, :content, :trip_id)
  end
end
