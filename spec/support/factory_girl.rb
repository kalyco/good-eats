require 'factory_girl'

FactoryGirl.define do
  factory :restaurant do
    id 20
    name "Joes Diner"
    address "7 Main Street"
    city "Lee"
    state "MA"
    zipcode "02138"
      factory :restaurant1 do
        id 22
        name "Anna Taqueria"
        address "Porter Square"
        city "Cambridge"
        state "MA"
        zipcode "02119"
    end
  end
end

FactoryGirl.define do
  factory :review do
    body "this place definitely has food"
    restaurant_id 20
      factory :review1 do
        body "would eat again. but not here"
        restaurant_id 22
          factory :review2 do
            body "meh"
            restaurant_id 20
        end
      end
    end
  end

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end
end
