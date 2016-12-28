require 'rails_helper'

RSpec.describe SundayPage, type: :model do
  it { should validate_presence_of(:info)}

  it { should have_many(:pictures)}
end
