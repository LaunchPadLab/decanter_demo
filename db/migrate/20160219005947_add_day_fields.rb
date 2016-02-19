class AddDayFields < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :start_day, :integer
    add_column :trips, :start_month, :integer
    add_column :trips, :start_year, :integer
  end
end
