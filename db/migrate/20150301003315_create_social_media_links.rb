class CreateSocialMediaLinks < ActiveRecord::Migration
  def change
    create_table :social_media_links do |t|
      t.string :name
      t.string :url
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :social_media_links, :users
  end
end
