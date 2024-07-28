class ChangeDiariesPrimaryKeyToUuid < ActiveRecord::Migration[7.1]
  def change
     execute 'ALTER TABLE diaries DROP CONSTRAINT diaries_pkey;'
     execute 'ALTER TABLE diaries ADD PRIMARY KEY (uuid);'
  end
end
