class TripsController < ApplicationController
  def new
    @trip = Trip.new
    2.times do |i|
      @trip.destinations.build(city: "City ##{i + 1}")
    end
  end

  def create
    @trip = Trip.decant_new(params[:trip])
    raise "hello"
    if @trip.save
      redirect_to trips_path
    else
      render 'new'
    end
  end
end
