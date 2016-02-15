class TripDecanter
  include Decanter::Core
  input :name, :string
  input :start_date, :date
  input :end_date, :date
  has_many :destinations
end
