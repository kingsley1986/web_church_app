require 'rails_helper'

RSpec.describe SonPage, type: :model do
  it { should validate_presence_of(:info)}

  it { should have_many(:pictures)}
end
