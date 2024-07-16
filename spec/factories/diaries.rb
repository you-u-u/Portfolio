FactoryBot.define do
  factory :diary do
    association :user
    association :pose
    weight {50}
    memo {"memo"}
  end
end
