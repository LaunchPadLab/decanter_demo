class Truck < ActiveRecord::Base

  validates_presence_of :name, :make, :model, :year

  with_options on: :efficiency do
    validates_presence_of :fuel_type, :efficiency, :efficiency_unit
  end

  with_options on: :capacity do
    validates_presence_of :trailer_type, :capacity
  end

  with_options on: :costs do
    validates_presence_of :monthly_maintence_costs
  end
end
