class Trip < ActiveRecord::Base
  has_many :destinations
  accepts_nested_attributes_for :destinations

  include Decanter::Core
  input :name, :string
  input :start_date, :date
  input :end_date, :date
end
