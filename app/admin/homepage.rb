ActiveAdmin.register Homepage do

  permit_params :info, :image

  form do |f|
   f.inputs "Homepage" do
     f.input :info
     f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:medium))
   end
   f.actions
  end

  show do
    attributes_table do
      row :info
      row "Image" do |homepage|
        image_tag(homepage.image.url(:medium))
      end
    end
  end
end
