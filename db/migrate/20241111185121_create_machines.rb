class CreateMachines < ActiveRecord::Migration[8.0]
  def change
    create_table :machines do |t|
      t.integer :number
      t.string :operator
      t.string :status

      t.timestamps
    end
  end
end
