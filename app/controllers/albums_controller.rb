class AlbumsController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
    @album = Album.new
  end

  def create
    @album = Album.new
    @album.photos = params[:album][:files]
    @trip = Trip.find(params[:trip_id])
    @album.trip = @trip
    if @album.save
      flash[:notice] = "Album added to your trip!"
      redirect_to trip_path(params[:trip_id])
    else
      flash.now[:alert] = @album.errors.full_messages.join(". ")
      render :new
    end
  end
end
