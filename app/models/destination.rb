class Destination < ActiveRecord::Base
  validates_presence_of :arrival_date, :departure_date, :city, :state
end
