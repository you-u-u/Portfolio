class SendLineJob < ApplicationJob
  include Rails.application.routes.url_helpers
  queue_as :default

  def perform
    User.find_each do |user|
      # 全ユーザーを対象にリマインダー通知を送信する
      next unless user.line_notification
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
    host = host_url
    url = ActionController::Base.helpers.asset_url(pose.image, host: host)
    unless url =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Rails.logger.error "Generated invalid URL: #{url}"
      raise "Generated invalid URL: #{url}"
    end
    Rails.logger.info "Generated asset URL: #{url}"
    url
  end

  def host_url
    Rails.application.config.host_url || 'https://www.yoga-diary-app.com'
  end
end