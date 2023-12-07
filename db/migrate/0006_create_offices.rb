class CreateOffices < ActiveRecord::Migration[7.1]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :description
      t.integer :position

      t.timestamps
    end
  end
end
