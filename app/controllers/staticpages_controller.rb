class StaticpagesController < ApplicationController
  def top
    @pose = Pose.all
  end
end
