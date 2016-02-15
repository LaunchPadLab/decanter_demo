class Destination < ActiveRecord::Base
  validates_presence_of :city, :state, :arrival_date, :departure_date
end
