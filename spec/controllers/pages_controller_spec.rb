require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let(:page) { create(:page) }

  describe 'GET index' do
    it 'should get pages according to what is selected' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
