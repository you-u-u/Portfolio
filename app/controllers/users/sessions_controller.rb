class Users::SessionsController < Devise::SessionsController
  def new 
    redirect_to user_line_omniauth_authorize_path
  end

  def destroy
    #logout
    sign_out(current_user)
    redirect_to root_path, status: :see_other, notice: "ログアウトしました"
  end
end
# 追加
