class SquashedTripDecanter < Decanter::Base
  input :start_day, :integer
  input :start_month, :integer
  input :start_year, :integer
  input :end_day, :integer
  input :end_month, :integer
  input :end_year, :integer
  squashed_input :start_date, :date, squash: [:start_day, :start_month, :start_year]
  squashed_input :end_date, :date, squash: [:end_day, :end_month, :end_year]
  input :name, :string
end
