class AddAboutPageIdToPicture < ActiveRecord::Migration
  def change
    add_reference :pictures, :about_page, index: true, foreign_key: true
  end
end
