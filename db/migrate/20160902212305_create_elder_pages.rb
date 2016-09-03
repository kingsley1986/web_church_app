class CreateElderPages < ActiveRecord::Migration
  def change
    create_table :elder_pages do |t|
      t.text :info

      t.timestamps null: false
    end
  end
end
