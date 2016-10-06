class Picture < ActiveRecord::Base
  mount_uploader :image, PictureImageUploader

  belongs_to :user
  belongs_to :post
  belongs_to :picturable, polymorphic: true
  belongs_to :comment
  belongs_to :about_page
  belongs_to :sunday_page
  belongs_to :tuesday_page
  belongs_to :thursday_page
  belongs_to :father_page
  belongs_to :son_page
  belongs_to :holyspirit_page
end
