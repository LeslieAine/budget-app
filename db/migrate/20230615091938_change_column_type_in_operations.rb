class ChangeColumnTypeInOperations < ActiveRecord::Migration[7.0]
  def change
    change_column :operations, :amount, :decimal, precision: 10, scale: 2
  end
end
