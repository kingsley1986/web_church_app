class Homepage < ActiveRecord::Base
  
  validates :info, presence:true
end
