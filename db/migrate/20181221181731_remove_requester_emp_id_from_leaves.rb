class RemoveRequesterEmpIdFromLeaves < ActiveRecord::Migration[5.2]
  def change
    remove_column :leaves, :requester_emp_id, :string
  end
end
