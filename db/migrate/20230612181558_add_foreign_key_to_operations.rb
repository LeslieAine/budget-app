class AddForeignKeyToOperations < ActiveRecord::Migration[7.0]
  def change
    add_reference :operations, :users, column: :author_id
  end
end
