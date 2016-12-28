class AddTuesdayIdToPicture < ActiveRecord::Migration
  def change
    add_reference :pictures, :tuesday_page, index: true, foreign_key: true
  end
end
