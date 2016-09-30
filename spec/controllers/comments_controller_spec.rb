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
    context "do" do
      before(:each) do
        @post = FactoryGirl.build(:post)
        @post.user_id = user.id
        @post.save
        @comment_attributes = FactoryGirl.attributes_for(:comment, post_id: @post)
      end

      it 'deletes a comment' do
        comment = create(:comment)
        @post.comments << comment
        expect{delete :destroy, id: comment.id, commentable_id: @post.id,  post_id: @post}.
        to change{@post.comments.count}.by(-1)
        expect(response).to redirect_to posts_path
      end
    end
  end
end
