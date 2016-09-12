class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :pictures, as: :picturable

  validates :title, presence: true
  validates :post_body, presence: true
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :pictures
end
