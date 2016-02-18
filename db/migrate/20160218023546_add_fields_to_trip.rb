class AddFieldsToTrip < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :day, :integer
    add_column :trips, :month, :integer
    add_column :trips, :year, :integer
  end
end
