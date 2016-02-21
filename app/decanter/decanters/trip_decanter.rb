class TripDecanter < Decanter::Base
  # strict :with_exception

  # input [:start_day, :start_month, :start_year], :date_squash, key: :start_date
  input :start_date, :date
  input :end_date, :date
  input :name, :string
  has_many :destinations
end
