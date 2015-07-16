class AddUserToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :user, index: true
    add_foreign_key :projects, :users
  end
end
