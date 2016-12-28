class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :image
      t.references :user, index: true, foreign_key: true
      t.references :picturable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
