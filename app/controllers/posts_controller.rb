class PostsController < ApplicationController

  before_action :find_post_id, except: [:index, :like, :new, :create]

  def index
    @posts = Post.paginate(page: params[:page], per_page:  8)
  end

  def show
  end

  def like
    @post = Post.find(params[:id])
     Like.create(likeable: @post, user: current_user, like: params[:like])
     redirect_to :back
  end


  def unlike
    @post = @post.likes.each do |user_like|
      if user_like.user_id ==  current_user.id
        user_like.destroy
        redirect_to :back
      end
    end
  end

  def new
    if pastor
      @post = Post.new
    else
      redirect_to :back
    end
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    if pastor
      @post.save
        redirect_to posts_path
      else
        render :new
      end
  end


  def edit
  end

  def update
    if pastor
      if @post.update(post_params)
        redirect_to post_path(@post)
      else
        render new
      end
    end
  end

  def find_post_id
    @post  = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:id, :title, :post_body, pictures_attributes: [:id, :post_id, :image])
  end
end
