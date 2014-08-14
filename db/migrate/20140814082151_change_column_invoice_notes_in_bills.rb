class ChangeColumnInvoiceNotesInBills < ActiveRecord::Migration
  def change
    rename_column :bills, :invoice_notes, :bill_notes
  end
end
