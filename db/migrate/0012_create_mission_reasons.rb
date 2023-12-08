class CreateMissionReasons < ActiveRecord::Migration[7.1]
  def change
    create_table :mission_reasons do |t|
      t.string :name
      t.integer :position
      t.integer :operator_id, null: false

      t.timestamps
    end
  end
end
