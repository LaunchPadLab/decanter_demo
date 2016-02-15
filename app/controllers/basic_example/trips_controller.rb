class BasicExample::TripsController < ApplicationController
  def create
    hash = Trip.decant(trip_params)
    @trip = Trip.new(hash)

    if @trip.save
      redirect_to basic_example_trip_path(@trip)
    else
      render 'new'
    end
  end

  private

    def trip_params
      params.require(:trip).permit(:name, :start_date, :end_date)
    end
end
