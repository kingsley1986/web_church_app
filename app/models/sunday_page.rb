class SundayPage < ActiveRecord::Base
  validates :info, presence: true
end
