require 'rails_helper'

RSpec.describe FatherPage, type: :model do
  it { should validate_presence_of(:info)}
end
