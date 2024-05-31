class PosesController < ApplicationController
  before_action :set_pose, only: [:show]

  def show;
   pose = @pose
  end

  private

  def set_pose
    @pose = Pose.all.shuffle.first
  end
end
