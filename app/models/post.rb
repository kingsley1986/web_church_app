class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true
  validates :post_body, presence: true
  accepts_nested_attributes_for :comments
end
