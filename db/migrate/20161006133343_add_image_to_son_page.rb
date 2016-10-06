class AddImageToSonPage < ActiveRecord::Migration
  def change
    add_column :son_pages, :image, :string
  end
end
