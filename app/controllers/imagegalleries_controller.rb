class ImagegalleriesController < ApplicationController

  def index
   @imagegallerys = Imagegallery.all
 end

 def create
    @image_gallery = Imagegallery.create(image_gallery_params)
     if  @image_gallery.save
       redirect_to imagegalleries_path
     else
       render :new
     end
 end

 def new
   @image_gallery = Imagegallery.new
 end

 private


 def image_gallery_params
   params.require(:imagegallery).permit(:image, :image_title, :image_description)
 end


end
