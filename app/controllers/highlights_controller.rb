class HighlightsController < ApplicationController
  def index
    if params[:search].present?
      @highlights = Highlight.near(params[:search], 50, :order => :distance)
    else
      @highlights = Highlight.all
    end
  end

  def show
    @trip = Trip.find(params[:trip_id])    
    @highlight = Highlight.find(params[:id])
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @highlight = Highlight.new
  end

  def create
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
