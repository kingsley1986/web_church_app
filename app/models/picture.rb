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



  # Post.find_each do |post|
  #   post.pictures.each do |p|
  #     p.image.recreate_versions! if p.image?
  #   end
  # end

  # Comment.find_each do |comment|
  #   comment.pictures.each do |c|
  #     c.image.recreate_versions! if c.image?
  #   end
  # end
end
