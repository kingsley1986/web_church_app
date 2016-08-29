class CreateHomepages < ActiveRecord::Migration
  def change
    create_table :homepages do |t|
      t.string :info

      t.timestamps null: false
    end
  end
end
