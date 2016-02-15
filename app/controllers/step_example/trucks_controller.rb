class StepExample::TrucksController < ApplicationController

  def index
    @trucks = Truck.all
  end

  def show
    @truck = Truck.find(params[:id])
  end

  def new
    @truck = Truck.new
  end

  def edit
    @truck = Truck.find(params[:id])
  end

  def update
    @truck = Truck.find(params[:id])
    if @truck.decant_update(truck_params)
      redirect_to step_example_truck_path(@truck)
    else
      render 'edit'
    end
  end

  def create
    @truck = Truck.decant_new(truck_params)
    if @truck.save
      redirect_to step_example_truck_path(@truck)
    else
      render 'new'
    end
  end

  private

    def truck_params
      params.require(:truck).permit!
    end
end
