require 'rails_helper'

RSpec.describe Diary, type: :model do
  describe 'バリデーションチェック' do
    let(:user) { create(:user) }
    let(:pose) { create(:pose) }
    let(:date) { Date.today }


    context 'ユーザーがログインしているとき' do
      it '設定したすべてのバリデーションが機能しているか' do
        diary=build(:diary,user: user, pose: pose)
        expect(diary).to be_valid
        expect(diary.errors).to be_empty
      end

      it 'user_idがない場合にバリデーションが機能してinvalidになるか' do
        diary_without_user_id=build(:diary, pose: pose, date: date)
        expect(diary_without_user_id).to be_invalid
        expect(diary_without_user_id.errors[:user_id]).to eq(["can't be blank"])      
      end

      it 'pose_idがない場合にバリデーションが機能してinvalidになるか' do
        diary_without_pose_id=build(:diary, pose_id:nil)
        expect(diary_without_pose_id).to be_invalid
        expect(diary_without_pose_id.errors[:pose_id]).to eq(["can't be blank"])
      end

      it 'weightが0以下の場合にバリデーションが機能してinvalidになるか' do
        diary_weight_less_than_0=build(:diary, weight:-10)
        expect(diary_weight_less_than_0).to be_invalid
        expect(diary_weight_less_than_0.errors[:weight]).to eq(["must be greater than 0"])
      end

      it 'memoが150文字より長い場合にバリデーションが機能してinvalidになるか' do
        diary_greater_than_150=build(:diary, memo:"a" * 151)
        expect(diary_greater_than_150).to be_invalid
        expect(diary_greater_than_150.errors[:memo]).to eq(["is too long (maximum is 150 characters)"])
      end

      it '1ユーザーが同じ日に2回以上diaryを登録した場合にバリデーションが機能してinvalidになるか' do
        diary=create(:diary, user: user, pose: pose, date: date)
        diary_of_same_day=build(:diary, user: user, pose: pose, date:date)
        expect(diary_of_same_day).to be_invalid
        expect(diary_of_same_day.errors[:base]).to eq(["今日のDiaryは登録してあります！また明日も頑張りましょう！"])
      end
    end
  end   
end
