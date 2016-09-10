module CommentsHelper

  def find_comment_like
   Comment.where(like_id: current_user.id)
  end
end
