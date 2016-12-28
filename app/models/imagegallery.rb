class Imagegallery < ActiveRecord::Base

  mount_uploader :image, GalleryUploader
  validates :image_description, presence: true
  validates :image_title, presence: true
  validates :image, presence: true
end
