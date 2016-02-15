FactoryGirl.define do
  factory :destination do
    arrival_date "02/12/2016"
    departure_date "02/14/2016"
    city Faker::Address.city
    state Faker::Address.state
    country Faker::Address.country
  end
end
