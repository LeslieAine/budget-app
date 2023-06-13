class CreateJoinTableOperationsGroups < ActiveRecord::Migration[7.0]
  def change
    create_join_table :operations, :groups do |t|
      t.index [:operation_id, :group_id]
      t.index [:group_id, :operation_id]
    end
  end
end