class PostsController < ApplicationController

  before_action :find_post_id, except: [:index, :like, :new, :create]

  def index
    @posts = Post.all
  end

  def show
  end

  def like
    post = Post.find(params[:id])
    Like.create(likeable: post, user: current_user, like: params[:like])
    flash[:success] = "Like Counted!"
    redirect_to :back
  end

  def unlike
    @post.likes.destroy_all
    redirect_to :back
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end


  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render new
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
