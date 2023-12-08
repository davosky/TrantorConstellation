class CreateTransports < ActiveRecord::Migration[7.1]
  def change
    create_table :transports do |t|
      t.integer :operator_id, null: false
      t.string :name
      t.string :position

      t.timestamps
    end
  end
end
