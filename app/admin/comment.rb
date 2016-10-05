ActiveAdmin.register Comment, as: 'PostComment' do
  permit_params :id, :body

   controller do
     defaults resource_class: Comment, collection_name: 'comments', instance_name: 'comment'
   end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
