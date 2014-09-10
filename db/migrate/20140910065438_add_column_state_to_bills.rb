class AddColumnStateToBills < ActiveRecord::Migration
  def change
    add_column :bills, :state, :string
  end
end
