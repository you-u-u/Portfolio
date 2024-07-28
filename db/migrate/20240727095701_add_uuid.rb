class AddUuid < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    add_column :diaries, :uuid, :uuid, default: 'gen_random_uuid()', null: false
    add_index :diaries, :uuid, unique: true

    Diary.reset_column_information 
    Diary.find_each { |diary| diary.update_column(:uuid, SecureRandom.uuid) }
  end
end
