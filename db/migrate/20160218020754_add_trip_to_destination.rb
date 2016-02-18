class AddTripToDestination < ActiveRecord::Migration[5.0]
  def change
    add_reference :destinations, :trip
  end
end
