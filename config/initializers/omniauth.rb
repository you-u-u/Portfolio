Rails.application.config.middleware.use OmniAuth::Builder do
  provider :line, ENV.fetch('LINE_KEY', nil), ENV.fetch('LINE_SECRET', nil), {
    callback_path: "/users/auth/line/callback",
    request_path: "/users/auth/line",
    scope: "profile openid",
    response_type: "code",
    state: SecureRandom.hex(24)
  }
end

OmniAuth.config.logger = Rails.logger
OmniAuth.config.allowed_request_methods = [:post]
OmniAuth.config.logger = Rails.logger
