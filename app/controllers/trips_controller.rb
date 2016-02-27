class TripsController < ApplicationController
  def new
    @trip = Trip.new
    build_destinations
  end

  def create
    hash = Trip.decant_create(params[:trip], decanter: 'StoopDecanter')
  end

  private

    def build_destinations
      3.times do |i|
        @trip.destinations.build(city: "Destination City #{i}")
      end
    end
end
