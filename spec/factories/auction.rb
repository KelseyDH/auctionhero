# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :auction do
    title Faker::Commerce.product_name
    body Faker::Company.bs
    end_date "2014-05-20 12:00:54"
    reserve_price 500
    threshold false
  end
end
