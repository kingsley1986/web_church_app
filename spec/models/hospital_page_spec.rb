require 'rails_helper'

RSpec.describe HospitalPage, type: :model do
  it { should validate_presence_of(:info)}
end
