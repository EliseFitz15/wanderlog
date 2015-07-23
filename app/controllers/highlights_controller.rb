class HighlightsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @highlight =
    if params[:search].present?
      @highlights = Highlight.near(params[:search], 50, order: :distance)
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

  def edit
    @trip = Trip.find(params[:trip_id])
    @highlight = Highlight.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:trip_id])
    @highlight = Highlight.find(params[:id])

    if @highlight.update(highlight_params)
      flash[:notice] = "Your post has been updated successfully."
      redirect_to trip_path(@trip)
    else
      flash.now[:alert] = @highlight.errors.full_messages.join(":( ")
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @highlight = Highlight.find(params[:id]).destroy
    flash[:notice] = "Highlight Deleted"
    redirect_to trip_path(@trip)
  end

  def highlight_params
    params.require(:highlight).permit(
      :location_name,
      :memory,
      :latitude,
      :longitude,
      :trip_id,
      :address,
      :highlight_photo
    )
  end
end
