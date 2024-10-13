class CreateRoads < ActiveRecord::Migration[7.0]
  def change
    create_table :roads do |t|
      t.string :name
      t.decimal :road_lenght, precision: 8, scale: 2
      t.decimal :highway_cost, precision: 8, scale: 2
      t.integer :position
      t.references :user, null: true, foreign_key: false
    end
  end
end
