class CreateFoodPages < ActiveRecord::Migration
  def change
    create_table :food_pages do |t|
      t.text :info

      t.timestamps null: false
    end
  end
end
