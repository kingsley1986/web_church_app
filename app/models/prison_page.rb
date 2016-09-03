class PrisonPage < ActiveRecord::Base
  validates :info, presence: true

end
