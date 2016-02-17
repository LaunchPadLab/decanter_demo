class AddSomeFields < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :driver_first_name, :string
    add_column :trips, :driver_last_name,  :string
    add_column :trips, :description,       :text
    add_column :trips, :tags,              :text, array: true
  end
end
