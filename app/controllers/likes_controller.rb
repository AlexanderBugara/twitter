class LikesController < ApplicationController
  def create
    micropost = Micropost.find_by(id: params[:micropost_id])
    #micropost.comments.build
    current_user.like(micropost)
    render json:[]
  end

  def destroy
    current_user.likes.find_by(id: params[:id]).destroy
    redirect_to request.referrer || root_url
  end
  
  def update
    debugger
  end
end
