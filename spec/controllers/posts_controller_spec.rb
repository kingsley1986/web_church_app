require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let(:poster) { create(:post, user_id: user.id)}

  before :each do
    request.env["HTTP_REFERER"] =  "http://test.host/"
    sign_in user
  end

  describe "POST #like" do
    subject { post :like, params }
    context "valid user" do
      let(:params) { { like: attributes_for(:like), like: true, id: poster.id }}

      it "creates like" do
        expect {subject}.to change(Like, :count).by(1)
      end

      it "should redirect_to back" do
        subject
        expect(response).to redirect_to :back
      end
    end
  end

  describe "POST #unlike" do
    subject { post :like, params }
    context "valid user" do
      let(:params) { { like: attributes_for(:like), like: true, id: poster.id }}


      it "unlike likes" do
        subject
        poster.likes.each do |po|
          expect {po.delete}.to change(Like, :count).by(-1)
        end
      end
    end
  end
end
