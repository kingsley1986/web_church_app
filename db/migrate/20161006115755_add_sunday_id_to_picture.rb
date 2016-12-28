class AddSundayIdToPicture < ActiveRecord::Migration
  def change
    add_reference :pictures, :sunday_page, index: true, foreign_key: true
  end
end
