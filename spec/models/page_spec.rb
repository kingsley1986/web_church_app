require 'rails_helper'

RSpec.describe Page, type: :model do
  it { should accept_nested_attributes_for :pictures }
  let(:page) { create(:page) }
  describe 'PAGE_TYPE' do
    it 'should have pick a single page_type randomly' do
      page.page_type = Page::PAGE_TYPE.sample
      expect(page).to be_valid
    end
    it 'should have lists of all the page_type' do
      page_type = [  'Childrens',
                     'Youths',
                     'Elders',
                     'Food',
                     'Prison',
                     'Hospital',
                     'Sunday',
                     'Tuesday',
                     'Thursday',
                     'Father',
                     'Son',
                     'Holy Spirit',
                     'Home Page',
                     'Contact'
                  ]
      expect(Page::PAGE_TYPE).to eq(page_type)
    end
  end
end
