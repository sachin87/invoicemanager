class AddUserIdToTables < ActiveRecord::Migration
  def change
    add_column :invoices, :user_id, :integer
    add_column :bills, :user_id, :integer
    add_column :entries, :user_id, :integer
    add_column :estimates, :user_id, :integer
    add_column :items, :user_id, :integer
    add_column :tasks, :user_id, :integer
 
    add_index :invoices, :user_id
    add_index :bills, :user_id
    add_index :entries, :user_id
    add_index :estimates, :user_id
    add_index :items, :user_id
    add_index :tasks, :user_id
    add_index :tickets, :user_id
  end
end
