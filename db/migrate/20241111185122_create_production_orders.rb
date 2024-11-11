class CreateProductionOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :production_orders do |t|
      t.references :machine, null: false, foreign_key: true
      t.string :program_number
      t.datetime :scheduled_start
      t.datetime :scheduled_end
      t.datetime :completed_at
      t.integer :progress

      t.timestamps
    end
  end
end
