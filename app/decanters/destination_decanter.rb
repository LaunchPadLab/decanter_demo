class DestinationDecanter
  include Decanter::Core
  input :city, :string
  input :state, :string
  input :arrival_date, :date
  input :departure_date, :date
end
