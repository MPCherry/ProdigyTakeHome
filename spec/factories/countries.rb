FactoryBot.define do
  factory :country do
    name { Faker::Lorem.word }
    a2 { Faker::Alphanumeric.alpha(number: 2).upcase }
    a3 { Faker::Alphanumeric.alpha(number: 3).upcase }
    enabled { 1 }
    currency_id { 1 }
  end
end
