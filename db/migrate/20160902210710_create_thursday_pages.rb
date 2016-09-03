class CreateThursdayPages < ActiveRecord::Migration
  def change
    create_table :thursday_pages do |t|
      t.text :info

      t.timestamps null: false
    end
  end
end
