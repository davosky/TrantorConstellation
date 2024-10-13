class CreateVeichles < ActiveRecord::Migration[7.0]
  def change
    create_table :veichles do |t|
      t.string :name
      t.string :producer
      t.string :license_plate
      t.string :fuel_type
      t.decimal :cost_per_km, precision: 8, scale: 2, default: 0.00
      t.string :territory
      t.integer :position
      t.references :user, null: true, foreign_key: false
    end
  end
end
