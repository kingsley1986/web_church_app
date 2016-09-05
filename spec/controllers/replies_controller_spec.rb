require 'rails_helper'

RSpec.describe RepliesController, type: :controller do

  let(:user) { create(:user) }
  let(:comment) { create(:comment)}


  before :each do
    sign_in user
  end

  describe "GET new" do
    subject { get :new, comment_id: comment.id}
    context "with valid params" do
      it 'creates the post' do
        subject
        expect(response).to render_template :new
      end
    end
  end



  # let(:user) { create(:user) }
  # describe "POST create" do
  #   subject { post :create, params }
  #   context "with valid params" do
  #
  #     let(:params) { { reply: attributes_for(:reply, reply_body: "reply"), comment_id: comment.id, user_id: user.id} }
  #     it 'creates the post' do
  #       subject
  #       # binding.pry
  #       expect{subject}.to change(Reply, :count).by(1)
  #     end

      # it "should redirect_to to post_path root" do
      #   expect(response).to redirect_to post_path(post)
      # end
  #     end
  #  end
end
