class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.date :date
      t.string :client
      t.text :description
      t.string :hours
      t.string :file
      t.string :link
      t.string :tag_list

      t.timestamps
    end
  end
end
