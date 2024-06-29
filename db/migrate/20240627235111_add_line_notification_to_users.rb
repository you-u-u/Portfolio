class AddLineNotificationToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :line_notification, :boolean, default: false, null: false
  end
end
