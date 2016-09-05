class CommentsController < ApplicationController


  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment].permit(:body))
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post)
    else
      render new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to posts_path(@post)
  end


  def like
    comment = Comment.find(params[:id])
    Like.create(likeable: comment, user: current_user, like: params[:like])
    flash[:success] = "Like Counted!"
    redirect_to :back
  end

  def unlike
    comment = Comment.find(params[:id])
    comment.likes.destroy_all
    redirect_to :back
  end

end
