class Comment < ActiveRecord::Base

  belongs_to :commentable, polymorphic: true
  belongs_to :post
  belongs_to :user
  validates :body, presence: true
  has_many :replies, dependent: :destroy

  has_many :likes, as: :likeable, dependent: :destroy
  has_many :pictures
  has_many :pictures, as: :picturable
  accepts_nested_attributes_for :replies
  accepts_nested_attributes_for :pictures

end
