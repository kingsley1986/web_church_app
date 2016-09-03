class CreateHospitalPages < ActiveRecord::Migration
  def change
    create_table :hospital_pages do |t|
      t.text :info

      t.timestamps null: false
    end
  end
end
