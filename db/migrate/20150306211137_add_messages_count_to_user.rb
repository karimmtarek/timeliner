class AddMessagesCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :message_counter, :integer, default: 0
  end
end
