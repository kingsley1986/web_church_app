require 'rails_helper'

RSpec.describe RepliesController, type: :controller do

  let(:user) { create(:user) }
  let(:comment) { create(:comment)}


  before :each do
    sign_in user
  end

  describe "GET new" do
    subject { get :new, comment_id: comment.id}
    context "valid user" do
      it 'gets the reply new' do
        subject
        expect(response).to render_template :new
      end
    end
  end

  describe "GET index" do
    subject { get :index, comment_id: comment.id}
    context "valid user" do
      it 'get the reply index' do
        subject
        expect(response).to render_template :index
      end
    end
  end

  describe "DELETE #destroy" do

    before :each do
      request.env["HTTP_REFERER"] =  "http://test.host/posts"
    end

    context "reply owner user" do

      it 'deletes the reply' do
        repl = create(:reply, user_id: user.id, comment_id: comment.id)
        expect{delete :destroy, id: repl.id}.
        to change(Reply, :count).by(-1)
        expect(response).to redirect_to reply_path(repl)
      end

      it "should redirect_to reply_path" do
        repl = create(:reply, user_id: user.id, comment_id: comment.id)
        delete :destroy, id: repl.id
        expect(response).to redirect_to reply_path(repl)
      end
    end

    context "not reply owner" do
    let(:another_user) { create(:user, email: "another_user@gmail.com", password: "password",
        first_name: "first_name", last_name: "last_name", phone: "3344", gender: "male") }

      it 'did not deletes the reply' do
        repl = create(:reply, user_id: another_user.id, comment_id: comment.id)
        delete :destroy, id: repl.id
        expect(response).to redirect_to :back
      end
    end
  end

  describe "POST create" do
    before :each do
      request.env["HTTP_REFERER"] =  "http://test.host/posts"
    end

    subject { post :create, params }
    context "with valid params" do

      let(:params) { { reply: attributes_for(:reply, user_id: user.id), comment_id: comment.id} }

      it 'creates the post' do
        expect{subject}.to change(Reply, :count).by(1)
      end

      it "should redirect_to to post_path root" do
        subject
        expect(subject).to redirect_to :back
      end
    end

    context "with invalid params" do

      let(:params) { { reply: attributes_for(:reply, reply_body: "", user_id: user.id), comment_id: comment.id} }

      it 'creates the post' do
        expect{subject}.to_not change(Reply, :count)
      end

      it "should redirect_to back to repl_path new" do
        expect(subject).to redirect_to :back
      end
    end
  end
end
