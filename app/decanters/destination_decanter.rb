class DestinationDecanter < Decanter::Base
  input :city
  input :state
  input :arrival_date, :date
  input :departure_date, :date
end
