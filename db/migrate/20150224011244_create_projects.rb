class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.belongs_to :milestone, index: true
      t.string :title
      t.text :description
      t.text :role
      t.string :client
      t.date :published_on
      t.string :link_live
      t.string :link_source

      t.timestamps null: false
    end
    add_foreign_key :projects, :milestones
  end
end
