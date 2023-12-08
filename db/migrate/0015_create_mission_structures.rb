class CreateMissionStructures < ActiveRecord::Migration[7.1]
  def change
    create_table :mission_structures do |t|
      t.string :name
      t.integer :position
      t.integer :operator_id, null: false

      t.timestamps
    end
  end
end
