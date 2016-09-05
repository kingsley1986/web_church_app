# require 'rails_helper'
#
# RSpec.describe CommentsController, type: :controller do
#
#   let(:user) { create(:user)  }
#
#   before :each do
#     sign_in user
#   end
#
#
#   describe "POST create" do
#     subject { post :create, params }
#     context "with valid params" do
#         let(:params) { { comment: attributes_for(:comment, body: "comment"), post_id: post.id } }
#       it 'creates the post' do
#         subject
#         expect{subject}.to change(Comment, :count).by(1)
#       end
#
#       it "should redirect_to to post_path root" do
#         expect(response).to redirect_to post_path(post)
#       end
#       end
#    end
# end
