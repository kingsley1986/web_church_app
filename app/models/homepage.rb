class Homepage < ActiveRecord::Base
  mount_uploader :image, PictureImageUploader
  
  validates :info, presence:true
end
