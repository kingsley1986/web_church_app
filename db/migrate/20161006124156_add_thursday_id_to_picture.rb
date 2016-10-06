class AddThursdayIdToPicture < ActiveRecord::Migration
  def change
    add_reference :pictures, :thursday_page, index: true, foreign_key: true
  end
end
