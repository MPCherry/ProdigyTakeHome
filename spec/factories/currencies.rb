FactoryBot.define do
  factory :currency do
    code { Faker::Alphanumeric.alpha(number: 3).upcase }
    full_name { Faker::Lorem.word }
  end
end
