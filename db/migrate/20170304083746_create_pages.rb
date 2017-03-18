class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :body
      t.string :type
      t.string :image

      t.timestamps null: false
    end
  end
end
