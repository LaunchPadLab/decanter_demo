class NoStrongParamsExample::TripsController < ApplicationController
  def create
    @trip = Trip.decant_new params[:trip],
                            decanter: NoStrongParamsTripDecanter

    if @trip.save
      redirect_to basic_example_trip_path(@trip)
    else
      render 'new'
    end
  end
end
