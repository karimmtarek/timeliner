class RemoveMilestoneFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :milestone_id, :integer
  end
end
