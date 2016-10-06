class AboutPage < ActiveRecord::Base
  mount_uploader :image, PictureImageUploader
  
  has_many :pictures, as: :picturable
  validates :info, presence: true
end
