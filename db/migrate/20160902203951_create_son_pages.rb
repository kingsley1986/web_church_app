class CreateSonPages < ActiveRecord::Migration
  def change
    create_table :son_pages do |t|
      t.text :info

      t.timestamps null: false
    end
  end
end
