require 'rails_helper'

RSpec.describe HolyspiritPage, type: :model do
  it { should validate_presence_of(:info)}
end
