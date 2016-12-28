class CreateImagegalleries < ActiveRecord::Migration
  def change
    create_table :imagegalleries do |t|
      t.string :image
      t.string :image_title
      t.string :image_description

      t.timestamps null: false
    end
  end
end
