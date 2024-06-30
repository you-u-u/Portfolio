class AddLineNotificationsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :line_notification_enabled, :boolean
  end
end
