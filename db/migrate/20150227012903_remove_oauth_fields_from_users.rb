class RemoveOauthFieldsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :oauth_token, :string
    remove_column :users, :oauth_token_secret, :string
  end
end
