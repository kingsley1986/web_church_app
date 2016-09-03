require 'rails_helper'

RSpec.describe ThursdayPage, type: :model do
  it { should validate_presence_of(:info)}
end
