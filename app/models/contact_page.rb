class ContactPage < ActiveRecord::Base

  validates :info, presence: true
end
