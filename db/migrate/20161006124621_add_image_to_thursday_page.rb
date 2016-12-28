class AddImageToThursdayPage < ActiveRecord::Migration
  def change
    add_column :thursday_pages, :image, :string
  end
end
