class HighlightsController < ApplicationController
  def index
  @trip = Trip.find(params[:trip_id])
  @highlight =
    if params[:search].present?
      @highlights = Highlight.near(params[:search], 50, :order => :distance)
    else
      @highlights = Highlight.all
    end

    @highlights = Highlight.all
    @hash = Gmaps4rails.build_markers(@highlights) do |highlight, marker|
      marker.lat highlight.latitude
      marker.lng highlight.longitude
    end
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @highlight = Highlight.find(params[:id])
  end

  def new
    @user = current_user
    @trip = Trip.find(params[:trip_id])
    @highlight = Highlight.new
  end

  def create
    @user = current_user
    @highlight = Highlight.new(highlight_params)
    @trip = Trip.find(params[:trip_id])
    @highlight.trip = @trip

    if @highlight.save
      flash[:notice] = "Highlight added to your trip!"
      redirect_to trip_path(params[:trip_id])
    else
      flash.now[:alert] = @highlight.errors.full_messages.join(". ")
      render :new
    end
  end

  def highlight_params
    params.require(:highlight).permit(:location_name, :memory, :latitude, :longitude, :user_id, :trip_id, :address)
  end
end
