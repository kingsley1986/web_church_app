require 'rails_helper'

RSpec.describe PrisonPage, type: :model do
  it { should validate_presence_of(:info)}
end
