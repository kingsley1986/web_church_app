class CommentsController < ApplicationController

  before_action :find_comment_id, except: [:like, :create]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post)
    else
      redirect_to :back
    end
  end

  def destroy
    if @comment.user_id == current_user.id || current_user.admin?
      @comment.destroy
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def index
    @comment = Comment.all
  end

  def like
    comment = Comment.find(params[:id])
    Like.create(likeable: comment, user: current_user, like: params[:like])
    flash[:success] = "Like Counted!"
    redirect_to :back
  end

  def unlike
    @comment.likes.each do |user_like|
      if user_like.user_id ==  current_user.id
        user_like.destroy
        redirect_to :back
      end
    end
  end

  def find_comment_id
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body, pictures_attributes: [:id, :comment_id, :image])
  end
end
