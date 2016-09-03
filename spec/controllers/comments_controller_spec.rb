require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:user) { create(:user)  }
  # let(:comment) { create(:comment)}

  before :each do
    sign_in user
  end

  describe "POST create" do
    context "with valid params" do
      it 'creates the post' do
        subject  { post :create, :comment, {body: "comment"}, post_id: post.id}
        expect{subject}.to change(Comment, :count).by(1)
      end

      # it "should redirect_to to post_path root" do
      #   expect(response).to redirect_to post_path(post)
      # end
    end
  end
end
