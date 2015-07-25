class AddAvailabilityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :available, :boolean, default: false
    add_column :users, :availability_message, :string
  end
end
