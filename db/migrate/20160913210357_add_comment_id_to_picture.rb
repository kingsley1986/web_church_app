class AddCommentIdToPicture < ActiveRecord::Migration
  def change
    add_reference :pictures, :comment, index: true, foreign_key: true
  end
end
