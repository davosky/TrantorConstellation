class CreateInstitutes < ActiveRecord::Migration[7.1]
  def change
    create_table :institutes do |t|
      t.string :name
      t.string :description
      t.integer :position

      t.timestamps
    end
  end
end
