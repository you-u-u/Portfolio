class Pose < ApplicationRecord
  has_many :diaries, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :japanese_name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :image, presence: true
end
