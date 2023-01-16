FactoryBot.define do
  factory :favorite do
    country { Faker::Address.country }
    recipe_link { Faker::Internet.url }
    recipe_title { Faker::Food.dish }
  end
end
