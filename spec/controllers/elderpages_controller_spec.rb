require 'rails_helper'

RSpec.describe ElderpagesController, type: :controller do

  let(:elderpage) { create(:elderpage)}

  describe "GET #index" do
    context "it get the index page" do
      it "get the homepage index page" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

end
