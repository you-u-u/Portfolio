class DeleteDiaryId < ActiveRecord::Migration[7.1]
  def change
    remove_column :diaries, :id
  end
end
