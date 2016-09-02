require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:user) { create(:user)  }

  before :each do
    sign_in user
  end

  describe "GET #new" do
    let(:post) { create(:post)}
    context "get new form" do

      it "should get new form" do
        get :new, post_id: post.id
        expect(response).to render_template :new
      end
    end
  end

  describe "POST create" do
    subject { post :create, post_id: post.id}
    context "post with valid params" do

      it "should create" do
        expect{subject}.to change(Comment, :count).by(1)
      end

      it "should redirect_to to post_path root" do
        subject
        expect(response).to redirect_to posts_path
      end
    end
  end
end
