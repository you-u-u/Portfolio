class PosesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[random show]

  def random
    @pose = Pose.order('RANDOM()').first
    redirect_to pose_path(@pose)
  end

  def show
    @pose = Pose.find(params[:id])
  end

  def bookmarks
    @bookmark_poses = current_user.bookmark_poses.order(created_at: :desc)
  end
end
