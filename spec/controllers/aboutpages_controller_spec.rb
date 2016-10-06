require 'rails_helper'

RSpec.describe AboutpagesController, type: :controller do

  describe "GET #index" do
    context "get the aboutpage index" do
      it "should get index" do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end
end
