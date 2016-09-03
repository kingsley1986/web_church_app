ActiveAdmin.register Post do


  permit_params :title, :post_body

  form do |f|
   f.inputs "Post Details" do
     f.input :title
     f.input :post_body
   end
   f.actions
 end

  before_create do |post|
     post.user_id = current_user.id
  end



end
