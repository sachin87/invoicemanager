class RemaneColumnPurchaseOrderNumberInBills < ActiveRecord::Migration
  def change
    rename_column :bills, :purchase_order_number, :bill_reference_number
  end
end
