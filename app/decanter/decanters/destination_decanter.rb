class DestinationDecanter < Decanter::Base
  strict true

  input :arrival_date, :ryan_date, ryans_format: '%m/%d/%Y'
  input :departure_date, :ryan_date, ryans_format: '%m/%d/%Y'
  input :city, :string
  input :state, :string
end
