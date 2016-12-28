class AddImageToFatherPage < ActiveRecord::Migration
  def change
    add_column :father_pages, :image, :string
  end
end
