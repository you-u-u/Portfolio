class CreateDiaries < ActiveRecord::Migration[7.1]
  def change
    create_table :diaries do |t|
      t.date :date, null: :false
      t.references :pose, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :compatibility
      t.string :condition
      t.string :feeling
      t.string :sleep
      t.text :memo
      t.float :weight

      t.timestamps
    end
  end
end
