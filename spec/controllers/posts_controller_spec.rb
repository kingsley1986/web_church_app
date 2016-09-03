# require 'rails_helper'
#
# RSpec.describe PostsController, type: :controller do
#   let(:user) { create(:user) }
#
#   before :each do
#     sign_in user
#   end
#
#   describe "GET #new" do
#     context "post with valid params" do
#       it "shoud get new" do
#         get :new
#         expect(response).to render_template :new
#       end
#     end
#   end
#
#   describe "POST create" do
#     subject { post :create, { user_id: user.id, post: params } }
#     context "post with valid params" do
#       let(:params) { {title: "title", post_body: "post" } }
#
#       it "should create" do
#         expect{subject}.to change(Post, :count).by(1)
#       end
#
#       it "should redirect_to to post_path root" do
#         subject
#         expect(response).to redirect_to posts_path
#       end
#     end
#   end
#
#   # describe "GET show" do
#   #   context "assings post" do
#   #       subject { get :show, { user_id: user.id} }
#   #     it 'assigns the post to @post' do
#   #       expect(assigns(:post)).to eq(post)
#   #     end
#   #   end
#   # end
#
#   describe "POST #create" do
#     subject { post :create, { user_id: user.id, post: params } }
#
#     context "post with invalid params" do
#       let(:params) { {title: "", post_body: "post" } }
#
#       it "should not create" do
#         expect{subject}.to_not change(Post, :count)
#       end
#
#       it "should redirect_to to post_path root" do
#         subject
#         expect(response).to render_template :new
#       end
#     end
#   end
# end
