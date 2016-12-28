require 'rails_helper'

RSpec.describe Reply, type: :model do
  it { should validate_presence_of(:reply_body) }

  it { should belong_to(:comment)}
end
