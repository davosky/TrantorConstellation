class CreateReimbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :reimbursements do |t|
      t.integer :name
      t.date :departure_date
      t.date :return_date
      t.date :request_date
      t.date :reimbursement_date

      t.decimal :parking_cost, precision: 8, scale: 2, default: 0.00
      t.decimal :food_cost, precision: 8, scale: 2, default: 0.00
      t.decimal :room_cost, precision: 8, scale: 2, default: 0.00
      t.decimal :ticket_cost, precision: 8, scale: 2, default: 0.00
      t.decimal :generic_cost, precision: 8, scale: 2, default: 0.00
      t.decimal :total_amount, precision: 8, scale: 2, default: 0.00

      t.references :place, null: true, foreign_key: false
      t.references :reason, null: true, foreign_key: false
      t.references :road, null: true, foreign_key: false
      t.references :structure, null: true, foreign_key: false
      t.references :transport, null: true, foreign_key: false
      t.references :user, null: true, foreign_key: false
      t.references :veichle, null: true, foreign_key: false

      t.string :place_fr
      t.string :reason_fr
      t.string :road_fr
      t.string :structure_fr
      t.string :transport_fr
      t.string :user_fr
      t.string :veichle_fr
      t.decimal :highway_cost_fr, precision: 8, scale: 2, default: 0.00
      t.decimal :road_lenght_fr, precision: 8, scale: 2, default: 0.00
    end
  end
end
