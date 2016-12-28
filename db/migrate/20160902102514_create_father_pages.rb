class CreateFatherPages < ActiveRecord::Migration
  def change
    create_table :father_pages do |t|
      t.string :info

      t.timestamps null: false
    end
  end
end
