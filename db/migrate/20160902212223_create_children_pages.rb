class CreateChildrenPages < ActiveRecord::Migration
  def change
    create_table :children_pages do |t|
      t.text :info

      t.timestamps null: false
    end
  end
end
