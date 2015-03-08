class AddSlugToMilestones < ActiveRecord::Migration
  def change
    add_column :milestones, :slug, :string
    add_index :milestones, :slug, unique: true
  end
end
