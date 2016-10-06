require 'rails_helper'

RSpec.describe Picture, type: :model do

  it { should belong_to (:picturable ) }
  it { should belong_to(:post) }
  it { should belong_to(:user) }
  it { should belong_to(:about_page) }
end
