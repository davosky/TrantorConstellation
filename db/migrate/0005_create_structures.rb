class CreateStructures < ActiveRecord::Migration[7.0]
  def change
    create_table :structures do |t|
      t.string :name
      t.integer :position
      t.references :user, null: true, foreign_key: false
    end
  end
end
