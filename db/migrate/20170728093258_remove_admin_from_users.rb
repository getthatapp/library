class RemoveAdminFromUsers < ActiveRecord::Migration[5.1]
  def up
    remove_column :users, :admin
  end

  def down
    add_column :users, :admin, :boolean, null: false, default: false    
  end
end
