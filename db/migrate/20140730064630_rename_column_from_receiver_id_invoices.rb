class RenameColumnFromReceiverIdInvoices < ActiveRecord::Migration
  def change
    rename_column :invoices, :to, :receiver_id
    change_column :invoices, :receiver_id, :integer
  end
end
