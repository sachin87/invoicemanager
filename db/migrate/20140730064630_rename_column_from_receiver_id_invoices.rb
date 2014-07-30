class RenameColumnFromReceiverIdInvoices < ActiveRecord::Migration
  def change
    rename_column :invoices, :to, :receiver_id
  end
end
