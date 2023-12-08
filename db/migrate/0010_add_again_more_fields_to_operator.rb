class AddAgainMoreFieldsToOperator < ActiveRecord::Migration[7.1]
  def change
    add_column :operators, :validator, :string
    add_column :operators, :validator_presentation, :string
    add_column :operators, :organizational, :string
    add_column :operators, :organizational_presentation, :string
    add_column :operators, :cost_per_km, :decimal, precision: 8, scale: 2, default: "0.00"
  end
end
