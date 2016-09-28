class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
    @picture.user = current_user
    @picture.save
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    if delete_picture
      @picture.delete
      redirect_to posts_path(@post)
    else
      redirect_to :back
    end
  end


  def private
    params.require(:picture).permit(:image)
  end
end
