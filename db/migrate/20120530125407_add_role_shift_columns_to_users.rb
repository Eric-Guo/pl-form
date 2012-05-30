class AddRoleShiftColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shift_code, :string
    add_column :users, :supervisor, :boolean
    add_column :users, :qa, :boolean
    add_column :users, :admin, :boolean
  end
end
