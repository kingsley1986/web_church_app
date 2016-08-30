ActiveAdmin.register Post do

permit_params :title, :post_body


  form do |f|
    f.inputs 'Details' do
      f.input :title
      f.input :post_body
    end
    f.actions
  end
end
