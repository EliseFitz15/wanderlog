class TripsController < ApplicationController
  def index
    @user = current_user
    @trips = @user.trips
    @past_trips = @user.trips.where("startdate < ?", Date.today)
    @future_trips = @user.trips.where("startdate > ?", Date.today)
  end

  def show
    @trip = Trip.find(params[:id])
    @album = @trip.albums.first
    @entries = [] | @trip.posts | @trip.albums | @trip.highlights
    @sorted_posts = @entries.sort_by(&:created_at)
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user

    if @trip.save
      flash[:notice] = "Trip added to your dashboard!"
      redirect_to trips_path
    else
      flash.now[:alert] = @trip.errors.full_messages.join(":( ")
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])

    if @trip.update(trip_params)
      flash[:notice] = "Your trip has been updated successfully."
      redirect_to trip_path(@trip)
    else
      flash.now[:alert] = @trip.errors.full_messages.join(":( ")
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id]).destroy
    flash[:notice] = "Trip Deleted"
    redirect_to trips_path
  end

  protected

  def trip_params
    params.require(:trip).permit(
      :title,
      :description,
      :startdate,
      :user_id,
      :cover_photo
    )
  end
end
