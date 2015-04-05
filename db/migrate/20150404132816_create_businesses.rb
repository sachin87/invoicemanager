class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.integer :account_owner_id, index: true
      t.string :first_name
      t.string :last_name
      t.string :business_name
      t.string :email, index: true
      t.string :phone
      t.string :website
      t.string :mobile
      t.boolean :is_organization
      t.string :fax
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
