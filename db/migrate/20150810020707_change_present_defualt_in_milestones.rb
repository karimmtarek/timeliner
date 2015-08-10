class ChangePresentDefualtInMilestones < ActiveRecord::Migration
  def up
    change_column_default :milestones, :present, true
  end

  def down
    change_column_default :milestones, :present, false
  end
end
