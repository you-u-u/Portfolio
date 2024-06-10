class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate_user!

  def line
    session[:pose_id] = params[:pose_id] #ここ
    #put logger.debug "Session pose_id set in line method: #{session[:pose_id]}"
    #binding.pry
    basic_action 
  end

  private

  def basic_action
    #binding.pry
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

    pose_id = session[:pose_id]
    Rails.logger.debug "Session pose_id retrieved in basic_action method: #{pose_id}" # セッションから取得したpose_idをログに出力
    session.delete(:pose_id)
    # 追加

    flash[:notice] = "ログインしました"
    redirect_to new_diary_path(pose_id: pose_id)
    #redirect_to root_path
  end

  def fake_email(uid, provider)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end

