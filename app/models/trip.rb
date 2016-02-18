class Trip < ActiveRecord::Base
  validates_presence_of :name, :start_date, :end_date
  has_many :destinations
  accepts_nested_attributes_for :destinations
end
