class TripsController < ApplicationController
  def new
    @trip = Trip.new
    build_destinations
  end

  def create
    hash = Trip.decant(params[:trip])
    raise "hello"
  end

  private

    def build_destinations
      3.times do |i|
        @trip.destinations.build(city: "Destination City #{i}")
      end
    end
end
