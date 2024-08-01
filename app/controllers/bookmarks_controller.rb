class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @pose = Pose.find(params[:pose_id])
    current_user.bookmark(@pose) 
    flash[:notice] = 'お気に入りに追加しました'
  end

  def destroy
    @pose = current_user.bookmarks.find(params[:id]).pose
    current_user.unbookmark(@pose)
    flash[:notice] = 'お気に入りを解除しました'
  end
end
