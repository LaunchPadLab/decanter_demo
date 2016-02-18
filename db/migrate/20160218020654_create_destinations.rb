class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.date :arrival_date
      t.date :departure_date
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
