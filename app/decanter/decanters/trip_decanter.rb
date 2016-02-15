class TripDecanter < Decanter::Base
  input :name, :custom
  input :start_date, :date
  input :end_date, :date
  has_many :destinations
end
