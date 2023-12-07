class AddMoreFieldsToOperator < ActiveRecord::Migration[7.1]
  def change
    add_reference :operators, :region, null: true, foreign_key: true
    add_reference :operators, :province, null: true, foreign_key: true
    add_reference :operators, :category, null: true, foreign_key: true
    add_reference :operators, :institute, null: true, foreign_key: true
    add_reference :operators, :office, null: true, foreign_key: true
  end
end
