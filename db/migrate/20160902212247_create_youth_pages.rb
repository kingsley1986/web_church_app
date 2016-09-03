class CreateYouthPages < ActiveRecord::Migration
  def change
    create_table :youth_pages do |t|
      t.text :info

      t.timestamps null: false
    end
  end
end
