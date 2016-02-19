class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.decant_new(params[:trip])
    parse_start_date

    if @trip.save
      redirect_to trips_path
    else
      render 'new'
    end
  end

  def update
    @trip = Trip.find(params[:id])

    parse_start_date
  end

  def parse_start_date

  end
end
