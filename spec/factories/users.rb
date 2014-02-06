require 'faker'

FactoryGirl.define do 
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    gender "male"
    dob Date.new(2010, 8, 27)
    zip 11211
  end 
end