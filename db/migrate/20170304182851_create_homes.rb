class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :body
      t.string :image

      t.timestamps null: false
    end
  end
end
