class Pose < ApplicationRecord
  validates :japanese_name, presence:true
  validates :description, presence:true
  validates :image, presence:true

end
