class DestinationDecanter < Decanter::Base
  strict :with_exception

  input :arrival_date, :date
  input :departure_date, :date
  input :city, :string
  input :state, :string
end
