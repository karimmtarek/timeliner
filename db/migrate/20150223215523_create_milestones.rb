class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :title
      t.string :company
      t.string :company_url
      t.string :location
      t.date :date_start
      t.date :date_end
      t.text :description
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :milestones, :users
  end
end
