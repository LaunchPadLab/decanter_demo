class Trip < ActiveRecord::Base
  validates_presence_of :start_date, :end_date, :name
  has_many :destinations
  accepts_nested_attributes_for :destinations
end
