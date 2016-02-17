class SquasherExample::TripsController < ApplicationController
  def create
    @trip = SquashedTripDecanter.decant_new(params[:trip])

    if @trip.save
      redirect_to basic_example_trip_path(@trip)
    else
      render 'new'
    end
  end
end
