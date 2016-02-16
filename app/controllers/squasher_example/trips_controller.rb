class SquasherExample::TripsController < ApplicationController
  def create
    decanted_hash = SquashedTripDecanter.decant(params[:trip])
    @trip = Trip.new(decanted_hash)

    if @trip.save
      redirect_to basic_example_trip_path(@trip)
    else
      render 'new'
    end
  end
end
