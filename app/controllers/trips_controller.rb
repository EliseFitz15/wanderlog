class TripsController < ApplicationController
  def index
    @user = current_user
    @trips = @user.trips
    # @futuretrips = @user.trips.where(:startdate.past? == false)
  end

  protected

  def trip_params
    params.require(:trip).permit(:title, :description, :startdate, :user_id)
  end
end
