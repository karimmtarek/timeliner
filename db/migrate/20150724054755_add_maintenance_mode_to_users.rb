class AddMaintenanceModeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :maintenance_mode, :boolean, default: true
  end
end
