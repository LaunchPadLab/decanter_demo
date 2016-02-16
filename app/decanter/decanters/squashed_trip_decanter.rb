class SquashedTripDecanter < Decanter::Base
  input [:start_month, :start_day, :start_year], :date_squash, key: :start_date
  input [:end_month,   :end_day,   :end_year],   :date_squash, key: :end_date
  input :name
end
