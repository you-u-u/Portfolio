class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate_user!

  def line
    session[:pose_id] = request.env['omniauth.params']['pose_id']
    Rails.logger.debug { "session pose_id set in line method: #{session[:pose_id]}" }
    basic_action 
  end

  private

  def basic_action
    pose_id = session[:pose_id]
    Rails.logger.debug { "Received session pose_id: #{session[:pose_id]}" }
    @omniauth = request.env["omniauth.auth"]
    if @omniauth.present?
      @profile = User.find_or_initialize_by(provider: @omniauth["provider"], uid: @omniauth["uid"])
      if @profile.email.blank?
        email = @omniauth["info"]["email"] ? @omniauth["info"]["email"] : "#{@omniauth["uid"]}-#{@omniauth["provider"]}@example.com"
        @profile = current_user || User.create!(provider: @omniauth["provider"], uid: @omniauth["uid"], email: email, name: @omniauth["info"]["name"], password: Devise.friendly_token[0, 20])
      end
      @profile.set_values(@omniauth)
      sign_in(:user, @profile)
    end

    flash[:notice] = "ログインしました"
    if pose_id.present?
      redirect_to pose_path(pose_id)
    else
      redirect_to random_pose_path
    end
    session.delete(:pose_id)

    #redirect_to new_diary_path(pose_id: pose_id) #記録ページへ遷移
    #redirect_to root_path
  end

  def fake_email(uid, provider)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end

