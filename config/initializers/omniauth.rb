Rails.application.config.middleware.use OmniAuth::Builder do
  provider :line, ENV.fetch('LINE_KEY', nil), ENV.fetch('LINE_SECRET', nil), {
    scope: 'profile openid',
    prompt: 'consent',
    bot_prompt: 'normal',
    redirect_uri: 'https://www.yoga-diary-app.com/users/auth/line/callback'
  }
end

OmniAuth.config.allowed_request_methods = [:post]
