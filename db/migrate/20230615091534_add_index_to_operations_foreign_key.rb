class AddIndexToOperationsForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_index :operations, :author_id
    add_index :groups, :user_id
  end
end
