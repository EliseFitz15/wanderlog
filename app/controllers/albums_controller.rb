class AlbumsController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
    @album = Album.new
  end

  def create
    # a = Album.new
    # a.photos = params[:photos]
    @trip = Trip.find(params[:trip_id])
    @album = Album.new(album_params)
    @album.trip = @trip

    if @album.save
      flash[:notice] = "Album added to your trip!"
      redirect_to trip_path(params[:trip_id])
    else
      flash.now[:alert] = @album.errors.full_messages.join(". ")
      render :new
    end
  end

  protected
  def album_params
    # a = Album.new
    # a.photos = params[:photos]
    params.require(:album).permit(:photos, :trip_id)
  end
end
