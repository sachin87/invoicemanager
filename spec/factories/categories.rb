# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    name "MyString"
    description "MyText"
    unit_price "9.99"
    unit "MyString"
  end
end
