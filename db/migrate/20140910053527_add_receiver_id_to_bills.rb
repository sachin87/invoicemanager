class AddReceiverIdToBills < ActiveRecord::Migration
  def change
    add_column :bills, :receiver_id, :integer
  end
end
