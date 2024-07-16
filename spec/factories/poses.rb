FactoryBot.define do
  factory :pose do
    sequence(:japanese_name, "pose_1")
    description {"description"}
    image {"image"}
  end
end