class Trip < ActiveRecord::Base
  has_many :destinations
  accepts_nested_attributes_for :destinations

  validates_presence_of :name, :start_date, :end_date
end
