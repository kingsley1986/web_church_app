ActiveAdmin.register FatherPage do

  permit_params :info, :image

  menu parent: 'Our Beliefs'

  form do |f|
   f.inputs "FatherPage" do
     f.input :info, wrapper_html: { class: 'homepages-choices'}
     f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:medium))
   end
   f.actions
  end
end
