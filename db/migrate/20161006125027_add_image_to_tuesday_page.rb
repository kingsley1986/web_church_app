class AddImageToTuesdayPage < ActiveRecord::Migration
  def change
    add_column :tuesday_pages, :image, :string
  end
end
