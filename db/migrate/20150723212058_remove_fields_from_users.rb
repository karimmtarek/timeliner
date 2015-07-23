class RemoveFieldsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :provider, :string
    remove_column :users, :uid, :string
    remove_column :users, :image, :string
    remove_column :users, :access_key, :string
    remove_column :users, :access_secret, :string
  end
end
