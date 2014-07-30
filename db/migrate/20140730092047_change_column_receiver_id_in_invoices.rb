class ChangeColumnReceiverIdInInvoices < ActiveRecord::Migration
  def change
    remove_column :invoices, :receiver_id
    add_column :invoices, :receiver_id, :integer
  end
end
