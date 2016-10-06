class Picture < ActiveRecord::Base
  mount_uploader :image, PictureImageUploader

  belongs_to :user
  belongs_to :post
  belongs_to :picturable, polymorphic: true
  belongs_to :comment
  belongs_to :about_page
end
