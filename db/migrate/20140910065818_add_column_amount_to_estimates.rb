class AddColumnAmountToEstimates < ActiveRecord::Migration
  def change
    add_column :estimates, :amount, :decimal
  end
end
