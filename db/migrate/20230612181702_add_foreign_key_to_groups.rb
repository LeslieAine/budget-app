class AddForeignKeyToGroups < ActiveRecord::Migration[7.0]
  def change
    add_reference :groups, :users
  end
end
