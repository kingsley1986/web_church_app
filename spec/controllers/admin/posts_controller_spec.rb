require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do
  let(:user) { create(:user, admin: true) }

  before(:each) do
    sign_in user
  end

  describe '#GET index' do
    subject { get :index }

    before :each do
      subject
    end

    context "an admin user" do
      it "should redirect to admin index path" do
        subject
        expect(response).to render_template "active_admin/resource/index"
      end
    end

    context "None admin user" do
      let(:user) { create(:user, admin: false) }

      it "should redirect to root_path" do
        subject
        expect(response).to redirect_to root_path
      end

      it "should send Alert message to the user" do
        expect(flash[:alert]).to eq("Access denied, you are not authorized to view this page")
      end
    end
  end

  describe '#POST create' do
    subject { post :create, params }

    context "an admin user" do
      let(:params) { { post: attributes_for(:post, title: "title", post_body: "body") } }

      it 'creates a product' do
        expect{ subject }.to change(Post, :count).by(1)
      end

      it 'assigns the product to the account' do
        subject
        expect(assigns[:post].user_id).to eq user.id
      end
    end

    context "None admin user" do
      let(:user) { create(:user, admin: false) }
      let(:params) { { post: attributes_for(:post, title: "post", post_body: "body") } }

      it 'does not creates a post' do
        expect{ subject }.to_not change(Post, :count)
      end
    end
  end

  describe '#DELETE destroy' do
    context "admin user" do
      let(:user) { create(:user, admin: true) }
      it 'deletes a comment' do
        post = create(:post, user_id: user.id)
        expect{delete :destroy, id: post.id, post_id: post}.
        to change(Post, :count).by(-1)
      end

      it "should redirect_to admin posts" do
        post = create(:post, user_id: user.id)
        delete :destroy, id: post.id, post_id: post
        expect(response).to redirect_to admin_posts_path
      end
    end
  end

  describe '#DELETE destroy' do

    before :each do
      request.env["HTTP_REFERER"] =  "http://test.host/"
    end

    context "non admin user" do
      let(:user) { create(:user, admin: false) }
      it 'deletes a comment' do
        post = create(:post, user_id: user.id)
        expect{delete :destroy, id: post.id, post_id: post}.
        to_not change(Post, :count)
      end

      it "should redirect_to admin posts" do
        post = create(:post, user_id: user.id)
        delete :destroy, id: post.id, post_id: post
        expect(response).to redirect_to :back
      end
    end
  end
end
