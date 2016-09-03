class RepliesController < ApplicationController

  def new
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.build
  end

   def create
      @comment = Comment.find(params[:comment_id])
     @reply = @comment.replies.create(params[:reply].permit(:reply_body))
     @reply.user = current_user
     if @reply.save
       redirect_to post_comments_path(:post_id, @comment)
     else
       render new
     end
   end

   def index
     @comments = Comment.find(params[:comment_id])
     @replies = @comments.replies
   end
end
