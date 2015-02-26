class AddPresentToMilestones < ActiveRecord::Migration
  def change
    add_column :milestones, :present, :boolean
  end
end
