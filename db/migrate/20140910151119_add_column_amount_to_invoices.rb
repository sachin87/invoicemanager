class AddColumnAmountToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :amount, :decimal
  end
end
