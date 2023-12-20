class CreateReimbursements < ActiveRecord::Migration[7.1]
  def change
    create_table :reimbursements do |t|
      # Identifiers
      t.integer :reimbursement_number

      # Dates
      t.date :departure_date
      t.date :return_date
      t.date :request_date
      t.date :reimbursement_date

      # Expences
      t.decimal :parking_cost, precision: 8, scale: 2, default: 0.00
      t.decimal :food_cost, precision: 8, scale: 2, default: 0.00
      t.decimal :room_cost, precision: 8, scale: 2, default: 0.00
      t.decimal :ticket_cost, precision: 8, scale: 2, default: 0.00
      t.decimal :generic_cost, precision: 8, scale: 2, default: 0.00
      t.decimal :total_amount, precision: 8, scale: 2, default: 0.00 # calculated sum value before_save

      # Descriptions
      t.integer :operator_id, null: true
      t.integer :mission_reason_id, null: true
      t.integer :mission_path_id, null: true
      t.integer :mission_place_id, null: true
      t.integer :mission_structure_id, null: true
      t.integer :transport_id, null: true
      t.integer :veichle_id, null: true

      # Free fill Duplicates (fr stands for free like free-fill)
      t.string :operator_fr
      t.string :reason_fr
      t.string :path_fr
      t.string :place_fr
      t.string :structure_fr
      t.string :transport_fr
      t.string :veichle_fr
      t.decimal :highway_cost_fr, precision: 8, scale: 2, default: 0.00
      t.decimal :path_lenght_fr, precision: 8, scale: 2, default: 0.00

      t.timestamps
    end
  end
end
