class HomesController < ApplicationController
  def index
  end

  def about
  end

  def wander
    @trips = Trip.all
  end
end
