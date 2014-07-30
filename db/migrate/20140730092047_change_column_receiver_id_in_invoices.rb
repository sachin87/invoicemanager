class ChangeColumnReceiverIdInInvoices < ActiveRecord::Migration
  def change
    change_column :invoices, :receiver_id, :integer
  end
end
