ActiveAdmin.register Post do


  permit_params :title, :post_body, comments_attributes: [:id, :body, :_destroy, replies_attributes: [:id, :reply_body, :_destroy ]]

  before_create do |post|
    post.user_id = current_user.id
  end

  before_update do |post|
    post.user_id = current_user.id
  end

  before_create do |comment|
    comment.user_id = current_user.id
  end

  before_update do |comment|
    comment.user_id = current_user.id
  end

  form do |f|
   f.inputs "Post Details" do
     f.input :title
     f.input :post_body, as: :text
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
     row :id
     row :title
     row :post_body
   end
   div class: "panel" do
     h3 "Comments"
     if post.comments && post.comments.count > 0
       div class: "panel_contents" do
         div class: "attributes_table" do
           table do
             tr do
               th do
                 "Comment Text"
               end
             end
             tbody do
               post.comments.each do |comment|
                 tr do
                   td do
                     comment.body
                   end
                 end
               end
             end
           end
         end
       end
     else
       h3 "No comments available"
     end
   end
 end
end
