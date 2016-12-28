require 'rails_helper'

RSpec.describe YouthPage, type: :model do
  it { should validate_presence_of(:info)}
end
