class TripsController < ApplicationController
  def index
    @user = current_user
    @trips = @user.trips
    # @futuretrips = @user.trips.where(:startdate.past? == false)
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

  protected

  def trip_params
    params.require(:trip).permit(:title, :description, :startdate, :user_id)
  end
end
