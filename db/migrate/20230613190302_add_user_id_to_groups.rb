class AddUserIdToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :user_id, :bigint
    add_foreign_key :groups, :users
  end
end
