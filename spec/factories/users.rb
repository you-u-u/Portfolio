FactoryBot.define do
  factory :user do
    sequence(:email){|n| "user_#{n}@example.com"}
    sequence(:provider) {|n| "provider#{n}"}
    password {"password"}
  end
end