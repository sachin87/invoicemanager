class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.decimal :unit_price
      t.string :unit

      t.timestamps
    end
  end
end
