class CreateRoads < ActiveRecord::Migration[7.2]
  def change
    create_table :roads do |t|
      t.string :name
      t.decimal :road_lenght, precision: 8, scale: 2, default: 0.00
      t.decimal :highway_cost, precision: 8, scale: 2, default: 0.00
      t.string :position
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
