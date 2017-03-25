require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  let(:page) { create(:page) }

  describe "#index" do
    it "should get pages according to what is selected" do
      binding.pry
      get :index
      expect(assigns(:pages)).to eq([page])
    end
  end

end
