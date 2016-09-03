require 'rails_helper'

RSpec.describe ChildrenPage, type: :model do
  it { should validate_presence_of(:info)}
end
