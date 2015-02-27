class AddAccessKeysToUsers < ActiveRecord::Migration
  def change
    add_column :users, :access_key, :string
    add_column :users, :access_secret, :string
  end
end
