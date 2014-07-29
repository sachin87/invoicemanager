class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :summary
      t.string :bill_from
      t.string :date
      t.string :bill_number
      t.string :bill_to
      t.date :due_on
      t.string :purchase_order_number
      t.text :invoice_notes

      t.timestamps
    end
  end
end
