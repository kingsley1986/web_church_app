require 'rails_helper'

RSpec.describe FoodPage, type: :model do
  it { should validate_presence_of(:info)}
end
