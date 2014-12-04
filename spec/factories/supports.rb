# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :support do
    subject "MyString"
    message "MyText"
    user_id 1
  end
end
