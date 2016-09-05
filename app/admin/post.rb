ActiveAdmin.register Post do


  permit_params :title, :post_body, comments_attributes: [:id, :body, :_destroy, replies_attributes: [:id, :reply_body]]
  actions :all, :except => [:destroy]

  before_create do |post|
    post.user_id = current_user.id
  end

  before_create do |comment|
    comment.user_id = current_user.id
  end

  form do |f|
   f.inputs "Post Details" do
     f.input :title
     f.input :post_body
   end
     f.has_many :comments do |fc|
       fc.input :body

     fc.has_many :replies do |fr|
       fr.input :reply_body
     end
   end
   f.actions
 end




  show do
    attributes_table do
      row :title
      row :post_body
      row :created_at
      row :user
    end
  end
end
