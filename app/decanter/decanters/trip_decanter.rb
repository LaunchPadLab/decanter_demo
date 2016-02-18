class TripDecanter < Decanter::Base
  strict true
  input [:day, :month, :year], :date_squash, key: :start_date
  input :end_date, :ryan_date, ryans_format: '%m/%d/%Y'
  input :name, :string
  has_many :destinations
end
