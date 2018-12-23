class AddAdminActionToLeaves < ActiveRecord::Migration[5.2]
  def change
    add_column :leaves, :admin_action, :string
  end
end
