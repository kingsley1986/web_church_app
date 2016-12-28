class FoodPage < ActiveRecord::Base
  validates :info, presence: true

end
