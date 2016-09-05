class LikesController < ApplicationController

  def like
    post = Post.find(params[:id])
    Like.create(likeable: post, user: current_user, like: params[:like])
    flash[:success] = "Like Counted!"
    redirect_to :back
  end
end
