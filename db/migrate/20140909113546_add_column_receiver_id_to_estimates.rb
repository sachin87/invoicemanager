class AddColumnReceiverIdToEstimates < ActiveRecord::Migration
  def change
    add_column :estimates, :receiver_id, :integer
  end
end
