class RemoveUsersIdFromGroups < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :users_id
  end
end
