class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :summary
      t.string :from
      t.date :date
      t.string :bill_number
      t.string :to
      t.string :due_on
      t.string :purchase_order_number
      t.text :invoice_notes

      t.timestamps
    end
  end
end
