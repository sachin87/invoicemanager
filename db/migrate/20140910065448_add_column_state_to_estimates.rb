class AddColumnStateToEstimates < ActiveRecord::Migration
  def change
    add_column :estimates, :state, :string
  end
end
