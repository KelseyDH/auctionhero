# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bid do
    association :auction, factory: :auction
    amount 100
  end
end
