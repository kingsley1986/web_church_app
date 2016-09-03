class ChildrenPage < ActiveRecord::Base
  validates :info, presence: true
end
