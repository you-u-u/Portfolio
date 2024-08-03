config.omniauth :line, ENV.fetch('LINE_KEY'), ENV.fetch('LINE_SECRET'), {
  callback_path: "/users/auth/line/callback",
  request_path: "/users/auth/line",
  scope: "profile openid",
  response_type: "code",
  state: SecureRandom.hex(24)
}

OmniAuth.config.logger = Rails.logger
OmniAuth.config.allowed_request_methods = [:post]
OmniAuth.config.logger = Rails.logger
