class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :currency
      t.string :email
      t.string :phone
      t.string :mobile
      t.string :website
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
