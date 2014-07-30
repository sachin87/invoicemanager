class RemoveColumnFromFromInvoices < ActiveRecord::Migration
  def change
    remove_column :invoices, :from, :string
  end
end
