class AddMoreFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :location, :string
    add_column :users, :phone, :string
    add_column :users, :description, :text
    add_column :users, :image, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
