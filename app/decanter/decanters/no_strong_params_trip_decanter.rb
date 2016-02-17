class NoStrongParamsTripDecanter < Decanter::Base

  strict true

  input :name
  input [:start_month, :start_day, :start_year], :date_squash, key: :start_date
  input [:end_month,   :end_day,   :end_year],   :date_squash, key: :end_date
  input :driver_full_name,                       :full_name,   prefix: :driver
  input :tags,                                   :tags_to_array

  has_many :destinations
end
