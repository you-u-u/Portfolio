class Users::SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user!, only: %i[new]

  def new
    redirect_to user_line_omniauth_authorize_path
  end

  def destroy
    sign_out(current_user)
    flash[:notice] = 'ログアウトしました。'
    redirect_to root_path, status: :see_other, data: { turbo_method: :delete }
  end
end
