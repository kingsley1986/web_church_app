class AddRolesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :roles, :jsonb, default: []
  end
end
