class AddImageToSundayPage < ActiveRecord::Migration
  def change
    add_column :sunday_pages, :image, :string
  end
end
