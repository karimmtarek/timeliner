class AddClientUrlToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :client_url, :string
  end
end
