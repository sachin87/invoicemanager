class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :description
      t.integer :quantity
      t.float :rate
      t.float :amount
      t.date :date
      t.string :link
      t.text :tag_list
      t.string :file

      t.timestamps
    end
  end
end
