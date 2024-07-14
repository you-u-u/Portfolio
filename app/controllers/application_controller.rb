class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  rescue_from StandardError, with: :render_500
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404

  def routing_error
    raise ActionController::RoutingError, params[:path]
  end

  private
  
  def authenticate_user!
    unless user_signed_in?
      redirect_to user_line_omniauth_authorize_path
    end
  end

  def render_404(e = nil)
    logger.info "Rendering 404 error #{e.message}" if e
    render "errors/404", layout: false, status: :not_found
  end 

  def render_500(e = nil)
    logger.info "Rendering 500 error #{e.message}" if e
    render "errors/500", layout: false, status: :internal_server_error
  end
end
