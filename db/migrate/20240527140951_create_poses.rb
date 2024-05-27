class CreatePoses < ActiveRecord::Migration[7.1]
  def change
    create_table :poses do |t|
      t.string :japanese_name, null: false
      t.text :description, null: false
      t.text :benefit
      t.text :tip
      t.string :image, null: false

      t.timestamps
    end
    add_index :poses, [:japanese_name], unique: true
  end
end
