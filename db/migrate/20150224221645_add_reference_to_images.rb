class AddReferenceToImages < ActiveRecord::Migration
  def change
    add_reference :images, :project, index: true
    add_foreign_key :images, :projects
  end
end
