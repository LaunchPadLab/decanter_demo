class CreateTrucks < ActiveRecord::Migration[5.0]
  def change
    create_table :trucks do |t|
      t.string  :name
      t.string  :make
      t.string  :model
      t.integer :year
      t.string  :fuel_type
      t.float   :efficiency
      t.string  :efficiency_unit
      t.string  :trailer_type
      t.integer :capacity
      t.integer :monthly_maintence_costs
      t.timestamps
    end
  end
end
