class RemoveRoleFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :role, :text
  end
end
