class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private
  
  def authenticate_user!
    unless user_signed_in?
      redirect_to user_line_omniauth_authorize_path
    end
  end
end
