require "rails_helper"

RSpec.describe Homepage, type: :model do
  it { should validate_presence_of(:info) }
end
