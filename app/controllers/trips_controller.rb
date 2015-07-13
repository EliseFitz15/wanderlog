class TripsController < ApplicationController
  def index
    @user = current_user
    @trips = @user.trips
  end


end
