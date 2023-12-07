class CreateVeichles < ActiveRecord::Migration[7.1]
  def change
    create_table :veichles do |t|
      t.integer :operator_id, null: false
      t.string :producer
      t.string :model
      t.integer :position
      t.string :license_plate

      t.timestamps
    end
  end
end
