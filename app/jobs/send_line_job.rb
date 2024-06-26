class SendLineJob < ApplicationJob
  queue_as :default

  def perform
    User.find_each do |user|
      # 全ユーザーを対象にリマインダー通知を送信する
      # next unless user.receive_reminder_notifications
      # ユーザーが通知を受け取る設定になっているかチェック
      # binding.pry
      reminder_message = generate_reminder_message(user)
      # 通知メッセージをカスタマイズ
      LineNotifyService.send_message(user.uid, reminder_message) if user.uid.present?
      # LINE通知サービスを使用してリマインダーを送信
    end
  end

  private

  def generate_reminder_message(user)
    pose = Pose.order("RANDOM()").first
    {
      type: "template",
      altText: "today's yoga pose",
      template: {
        type: "buttons",
        thumbnailImageUrl: pose_image_url(pose),
        imageAspectRatio: "rectangle",
        imageSize: "cover",
        title: "今日のヨガポーズ：#{pose.japanese_name}",
        text: "サイトでやり方を見てやってみよう！\n 登録してDiaryに花を咲かせよう🌸",
        actions: [
          {
            type: "uri",
            label: "View",
            uri: "#{host_url}/poses/#{pose.id}"
          }
        ]
      }
    }
  end

  def pose_image_url(pose)
    # binding.pry
    host = Rails.application.config.host
    ActionController::Base.helpers.asset_url(pose.image, host:host).force_encoding('UTF-8')
  end

  def host_url
    Rails.application.config.host
  end
end
