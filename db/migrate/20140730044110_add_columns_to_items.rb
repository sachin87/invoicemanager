class AddColumnsToItems < ActiveRecord::Migration
  def change
    add_column :items, :itemeable_type, :string
    add_column :items, :itemeable_id, :integer
  end
end
