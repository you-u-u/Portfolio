class Diary < ApplicationRecord
  belongs_to :user
  belongs_to :pose

  validates :user_id, presence: true
  validates :pose_id, presence: true
  validates :weight, numericality: {greater_than: 0}, allow_nil: true
  validate :only_one_diary_per_day

  enum compatibility: { excellent: '◎', good: '〇', poor: '×' }, _prefix: true
  enum condition: { excellent: '◎', good: '〇', poor: '×' }, _prefix: true
  enum feeling: { excellent: '◎', good: '〇', poor: '×' }, _prefix: true
  enum sleep: { excellent: '◎', good: '〇', poor: '×' }, _prefix: true

  private
  def only_one_diary_per_day
    cache_key = "user_#{user_id}_diary#{Date.today}"
    if Rails.cache.fetch(cache_key).nil?
      if Diary.where(user_id: user_id,date:Date.today).exists?
        errors.add("今日の頑張りは登録してあります！また明日も頑張りましょう！")
      else
        Rails.cache.write(cache_key, true)
      end
    else
      errors.add("今日の頑張りは登録してあります！また明日も頑張りましょう！")
    end
  end
end
