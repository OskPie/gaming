FactoryBot.define do
  factory :computer do
    name { Faker::Lorem.word }
    user
  end
end
