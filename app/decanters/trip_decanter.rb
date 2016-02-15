class TripDecanter < Decanter::Base
  input :name, :string
  input :start_date, :date
  input :end_date, :date
  has_many :destinations, decanter: AlternativeDestinationDecanter
end
