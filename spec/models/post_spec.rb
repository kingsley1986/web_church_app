require 'rails_helper'

RSpec.describe Post, type: :model do

  it { should belong_to(:user) }
  it { should have_many(:comments).dependent(:destroy)}
  it { should have_many(:likes)}
  it { should have_many(:pictures)}

  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:post_body)}
  it{ should accept_nested_attributes_for :pictures }
end
