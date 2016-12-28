require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:post_com) { create(:post, user_id: user.id)}

  describe '#POST create' do
    subject { post :create, params }

    context "create post" do
      let(:params) { { comment: attributes_for(:comment), post_id: post_com.id } }

      it 'creates a new post' do
        expect{ subject }.to change(Post, :count).by(1)
      end

      it "should redirect_to to post_path root" do
        expect(response).to have_http_status(200)
      end

      it 'should redirect post path' do
          subject
        expect(response).to redirect_to post_path(post_com)
      end
    end

    context "with invalid params" do
      before(:each) do
        request.env["HTTP_REFERER"] =  "/posts/97"
        @post = FactoryGirl.build(:post)
        @post.user_id = user.id
        @post.save
        @comment_attributes = FactoryGirl.attributes_for(:comment, body: "", post_id: @post)
      end

      it "should not create a new comment" do
        expect {
          post :create, post_id: @post.id, comment: @comment_attributes
        }.to_not change(Comment, :count)
      end

      context 'when unsuccessed in' do
        before { post :create, comment: attributes_for(:comment), post_id:  @post.id, body: "" }

        it 'redirect to post path' do
          expect(response).to redirect_to post_path(@post)
        end
      end
    end
  end

  describe '#DELETE destroy' do
    context "comment owner" do
      before { controller.stub(:current_user).and_return user }

      before(:each) do
        request.env["HTTP_REFERER"] =  "http://test.host/"
        @post = FactoryGirl.build(:post)
        @post.save
      end

      it 'deletes a comment' do
        comment = create(:comment, user_id: user.id)
        @post.comments << comment
        expect{delete :destroy, id: comment.id, commentable_id: @post.id,  post_id: @post}.
        to change{@post.comments.count}.by(-1)
        expect(response).to redirect_to :back
      end

      it "should redirect_to post_path" do
        comment = create(:comment, user_id: user.id)
        @post.comments << comment
        delete :destroy, id: comment.id, commentable_id: @post.id,  post_id: @post
      end
    end


    context "non comment owner" do
      before { controller.stub(:current_user).and_return user }

      before(:each) do
        request.env["HTTP_REFERER"] =  "http://test.host/posts"
        @post = FactoryGirl.build(:post)
        @post.save
        @comment_attributes = FactoryGirl.attributes_for(:comment, post_id: @post)
      end

      let(:other_user) { create(:user, email: "other_user@gmail.com", password: "password",
          first_name: "first_name", last_name: "last_name", phone: "3344", gender: "male") }

      it " doesn't delete a comment" do
        comment = create(:comment, user_id: other_user.id)
        @post.comments << comment
        expect{delete :destroy, id: comment.id, user_id: other_user.id, commentable_id: @post.id,  post_id: @post}.
        to_not change{@post.comments.count}
      end

      it "should redirect_to post_path" do
        comment = create(:comment, user_id: user.id)
        @post.comments << comment
        delete :destroy, id: comment.id, commentable_id: @post.id,  post_id: @post
        expect(response).to redirect_to :back
      end
    end
  end

  describe "POST #like" do
    before :each do
      request.env["HTTP_REFERER"] =  "http://test.host/"
      sign_in user
    end

    let(:comment) { create(:comment, user_id: user.id)}
    subject { post :like, params }
    context "valid user" do
      let(:params) { { like: attributes_for(:like), like: true, id: comment.id }}

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
    before :each do
      request.env["HTTP_REFERER"] =  "http://test.host/"
      sign_in user
    end

    subject { post :like, params }
    context "valid user" do
      let(:comment) { create(:comment, user_id: user.id)}
      let(:params) { { like: attributes_for(:like), id: comment.id }}


      it "unlike likes" do
        subject
        comment.likes.each do |po|
          expect {po.delete}.to change(Like, :count).by(-1)
        end
      end

      it "should redirect back" do
        subject
        comment.likes.each do |po|
          po.delete
          expect(response).to redirect_to :back
        end
      end
    end
  end
end
