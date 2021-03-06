require "rails_helper"

RSpec.describe User, type: :model do

  it { should have_many(:posts) }
  it { should have_many(:pictures) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:password_confirmation) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:gender) }

end
