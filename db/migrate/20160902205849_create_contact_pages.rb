class CreateContactPages < ActiveRecord::Migration
  def change
    create_table :contact_pages do |t|
      t.text :info

      t.timestamps null: false
    end
  end
end
