class CreateTuesdayPages < ActiveRecord::Migration
  def change
    create_table :tuesday_pages do |t|
      t.text :info

      t.timestamps null: false
    end
  end
end
