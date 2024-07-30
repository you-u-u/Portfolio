class BookmarksController < ApplicationController
  def create
    pose = pose.find(params[:pose_id])
    current_user.bookmark(pose)
    flash.now[:notice] = 'お気に入りに追加しました'
  end

  def destroy
    pose = current_user.bookmarks.find(params[:pose_id])
    current_user.unbookmark(pose)
    flash.now[:notice] = 'お気に入りを解除しました'
  end
end
