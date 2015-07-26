class RenameBlogInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :blog, :blog_url
  end
end
