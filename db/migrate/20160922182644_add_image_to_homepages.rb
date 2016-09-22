class AddImageToHomepages < ActiveRecord::Migration
  def change
    add_column :homepages, :image, :string
  end
end
