class AddSonIdToPicture < ActiveRecord::Migration
  def change
    add_reference :pictures, :son_page, index: true, foreign_key: true
  end
end
