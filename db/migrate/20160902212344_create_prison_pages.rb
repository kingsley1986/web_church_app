class CreatePrisonPages < ActiveRecord::Migration
  def change
    create_table :prison_pages do |t|
      t.text :info

      t.timestamps null: false
    end
  end
end
