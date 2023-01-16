FactoryBot.define do
  factory :users_favorite do
    association :user, factory: :user
    association :favorite, factory: :favorite
  end
end