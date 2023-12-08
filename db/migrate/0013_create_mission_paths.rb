class CreateMissionPaths < ActiveRecord::Migration[7.1]
  def change
    create_table :mission_paths do |t|
      t.string :path
      t.decimal :road_lenght, precision: 8, scale: 2, default: 0.00
      t.decimal :highway_cost, precision: 8, scale: 2, default: 0.00
      t.integer :position
      t.integer :operator_id, null: false

      t.timestamps
    end
  end
end
