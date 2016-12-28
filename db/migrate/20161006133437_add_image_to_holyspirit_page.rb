class AddImageToHolyspiritPage < ActiveRecord::Migration
  def change
    add_column :holyspirit_pages, :image, :string
  end
end
