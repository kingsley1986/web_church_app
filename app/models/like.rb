class Like < ActiveRecord::Base
  belongs_to :likeable, polymorphic: true

  validates :like, presence: true
  belongs_to :user
  belongs_to :post
  belongs_to :comment
end
