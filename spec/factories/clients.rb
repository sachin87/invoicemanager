# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
    first_name "MyString"
    last_name "MyString"
    currency_id 1
    email "MyString"
    phone "MyString"
    website_url "MyString"
    street_address "MyString"
    city "MyString"
    state "MyString"
    zipcode "MyString"
    country_id 1
  end
end
