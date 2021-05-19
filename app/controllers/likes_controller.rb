class LikesController < ApplicationController
  def create
    micropost = Micropost.find_by(id: params[:micropost_id])
    current_user.like(micropost)
    @micropost = micropost
    redirect_to request.referrer || root_url
  end

  def destroy
    current_user.likes.find_by(id: params[:id]).destroy
    redirect_to request.referrer || root_url
  end
end
