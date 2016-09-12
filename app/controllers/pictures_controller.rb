class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
  end


  def private
    params.require(:picture).permit(:image)
  end
end
