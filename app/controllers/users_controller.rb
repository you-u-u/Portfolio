class UsersController < ApplicationController
  before_action :set_user, only: [:set_line_notification]

  def set_line_notification
    notification_setting = params[:line_notification] == '1'
    @user.update(line_notification: notification_setting)
  end

  private

  def set_user
    @user = current_user
  end
end
