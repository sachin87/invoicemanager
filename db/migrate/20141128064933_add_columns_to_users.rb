class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :date_of_birth, :string
    add_column :users, :street1, :string
    add_column :users, :street2, :string
    add_column :users, :company_logo, :string
  end
end
