module PostsHelper

  def find_post_like
   Post.where(like_id: current_user.id)
  end
end
