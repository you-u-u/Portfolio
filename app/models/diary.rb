class Diary < ApplicationRecord
  belongs_to :user
  belongs_to :pose

  validates :user_id, presence: true
  validates :pose_id, presence: true

  enum compatibility: { excellent: '◎', good: '〇', poor: '×' }, _prefix: true
  enum condition: { excellent: '◎', good: '〇', poor: '×' }, _prefix: true
  enum feeling: { excellent: '◎', good: '〇', poor: '×' }, _prefix: true
  enum sleep: { excellent: '◎', good: '〇', poor: '×' }, _prefix: true
end
