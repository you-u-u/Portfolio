class StaticpagesController < ApplicationController
  skip_before_action :authenticate_user!

  def top
    @poses=Pose.all
  end

  def privacy_policy; end

  def term; end

  def contact; end
end
