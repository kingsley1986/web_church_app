class AddFatherIdToPicture < ActiveRecord::Migration
  def change
    add_reference :pictures, :father_page, index: true, foreign_key: true
  end
end
