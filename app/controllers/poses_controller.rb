class PosesController < ApplicationController
  skip_before_action :authenticate_user! , only: %i[random show]

  def random
    @pose = Pose.order("RANDOM()").first
    # binding.pry
    redirect_to pose_path(@pose)
    
  end

  def show
    @pose = Pose.find(params[:id])
    #binding.pry
  end
end
# 追加