require 'rails_helper'

RSpec.describe Picture, type: :model do

  it { should belong_to (:picturable ) }
  it { should belong_to(:post) }
  it { should belong_to(:user) }
  it { should belong_to(:about_page) }
  it { should belong_to(:sunday_page) }
  it { should belong_to(:thursday_page) }
  it { should belong_to(:tuesday_page) }
  it { should belong_to(:father_page) }
  it { should belong_to(:son_page) }
  it { should belong_to(:holyspirit_page) }
end
