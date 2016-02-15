class TruckDecanter < Decanter::Base
  input :make_and_model, :make_and_model
    # input :year, :integer

  # with_context :efficiency do
  #   input :fuel_type
  #   input :efficiency, :float
  #   input :efficiency_unit
  # end

  # with_context :capacity do
  #   input :trailer_type
  #   input :capacity, :integer
  # end

  # with_context :costs do
  #   input :monthly_maintenance_costs, :integer
  # end
end
