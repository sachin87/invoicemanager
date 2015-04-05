class CreateBusinessUsers < ActiveRecord::Migration
  def change
    create_table :business_users do |t|
      t.belongs_to :user, index: true 
      t.belongs_to :business, index: true
      t.string :first_name
      t.string :last_name
      t.string :email, index: true
      t.string :phone
      t.string :mobile
      t.string :website
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :role, index: true

      t.timestamps
    end
  end
end
