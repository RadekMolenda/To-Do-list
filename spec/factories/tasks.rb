# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    description "MyString"
    completed false
    deadline "2012-06-24 15:01:34"
  end
end
