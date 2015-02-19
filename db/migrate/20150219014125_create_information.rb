class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.references :user, index: true
      t.string :uid
      t.string :token
      t.string :secret
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :description
      t.string :phone

      t.timestamps null: false
    end
    add_foreign_key :information, :users
  end
end
