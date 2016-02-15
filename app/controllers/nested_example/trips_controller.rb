class NestedExample::TripsController < ApplicationController
  def create
    hash = TripDecanter.decant(trip_params)
    @trip = Trip.new(hash)

    if @trip.save
      redirect_to basic_example_trip_path(@trip)
    else
      render 'new'
    end
  end

  private

    def trip_params
      params.require(:trip).permit(:name, :start_date, :end_date, destinations_attributes: [:city, :state, :arrival_date, :departure_date])
    end
end
