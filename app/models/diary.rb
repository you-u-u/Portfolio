class Diary < ApplicationRecord
  belongs_to :user
  belongs_to :pose

  before_create -> { self.uuid = SecureRandom.uuid }

  validates :weight, numericality: { greater_than: 0 }, allow_nil: true
  validates :memo, length: { maximum: 150 }
  validate :only_one_diary_per_day
  validate :register_today

  enum compatibility: { excellent: '◎', good: '〇', poor: '×' }, _prefix: true
  enum condition: { excellent: '◎', good: '〇', poor: '×' }, _prefix: true
  enum feeling: { excellent: '◎', good: '〇', poor: '×' }, _prefix: true
  enum sleep: { excellent: '◎', good: '〇', poor: '×' }, _prefix: true

  private

  def only_one_diary_per_day
    return unless Diary.where(user_id: user_id, date: date).where.not(uuid: uuid).exists?

    errors.add(:base, '今日のDiaryは登録してあります！また明日も頑張りましょう！')
  end

  def register_today
    return unless date != Time.zone.today

    errors.add(:date, '当日分のみ登録できます')
  end
end
