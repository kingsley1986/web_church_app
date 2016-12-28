class CreateAboutPages < ActiveRecord::Migration
  def change
    create_table :about_pages do |t|
      t.text :info
      t.string :image

      t.timestamps null: false
    end
  end
end
