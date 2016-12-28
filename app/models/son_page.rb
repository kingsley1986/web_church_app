class SonPage < ActiveRecord::Base
  mount_uploader :image, PictureImageUploader

  validates :info, presence:true
  has_many :pictures, as: :picturable

end
