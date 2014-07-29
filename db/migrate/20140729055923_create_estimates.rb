class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.string :summary
      t.string :from
      t.string :date
      t.string :number
      t.string :to
      t.date :due_on
      t.string :estimate_number
      t.text :estimate_notes

      t.timestamps
    end
  end
end
