class AddForeignKeyToGroups < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :groups, :users, column: :user_id
  end
end
