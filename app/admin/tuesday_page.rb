ActiveAdmin.register TuesdayPage do

  permit_params :info, :image
  menu parent: 'Worship Days'


  form do |f|
    f.inputs "TuesdayPage" do
      f.input :info, wrapper_html: { class: 'homepages-choices'}
      f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:medium))
    end
    f.actions
  end
end
