class SendLineJob < ApplicationJob
  include Rails.application.routes.url_helpers
  queue_as :default

  def perform
    User.find_each do |user|
      next unless user.line_notification

      reminder_message = generate_reminder_message(user)
      LineNotifyService.send_message(user.uid, reminder_message) if user.uid.present?
    end
  end

  private

  def generate_reminder_message(_user)
    pose = Pose.order('RANDOM()').first
    {
      type: 'template',
      altText: "today's yoga pose",
      template: {
        type: 'buttons',
        thumbnailImageUrl: pose_image_url(pose),
        imageAspectRatio: 'rectangle',
        imageSize: 'cover',
        title: "今日のヨガポーズ：#{pose.japanese_name}",
        text: "サイトでやり方を見てやってみよう！\n 登録してDiaryに花を咲かせよう🌸",
        actions: [
          {
            type: 'uri',
            label: 'View',
            uri: "#{host_url}/poses/#{pose.id}"
          }
        ]
      }
    }
  end

  def pose_image_url(pose)
    host = host_url
    url = ActionController::Base.helpers.asset_url(pose.image, host: host)
    unless /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/.match?(url)
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
