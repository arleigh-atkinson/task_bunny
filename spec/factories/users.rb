FactoryGirl.define do
   factory :users, class: User do
    sequence(:email){ |n| "user#{n}@example.com"}
    password 'password'
  end
end
