class AddHolyspiritIdToPicture < ActiveRecord::Migration
  def change
    add_reference :pictures, :holyspirit_page, index: true, foreign_key: true
  end
end
