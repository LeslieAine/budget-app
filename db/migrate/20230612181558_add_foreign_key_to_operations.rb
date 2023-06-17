class AddForeignKeyToOperations < ActiveRecord::Migration[7.0]
  def change
    add_reference :operations, :user, column: :author_id
  end
end
