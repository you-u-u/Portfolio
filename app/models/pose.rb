class Pose < ApplicationRecord
  validates :japanese_name, presence:true, uniqueness:true
  validates :description, presence:true
  validates :image, presence:true
end
