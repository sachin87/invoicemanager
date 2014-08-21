class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :currency_id
      t.string :email
      t.string :phone
      t.string :website_url
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :country_id

      t.timestamps
    end
  end
end
