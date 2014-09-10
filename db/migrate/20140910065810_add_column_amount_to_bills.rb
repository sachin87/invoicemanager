class AddColumnAmountToBills < ActiveRecord::Migration
  def change
    add_column :bills, :amount, :decimal
  end
end
