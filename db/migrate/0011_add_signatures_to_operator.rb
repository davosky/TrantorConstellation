class AddSignaturesToOperator < ActiveRecord::Migration[7.1]
  def change
    add_column :operators, :signature, :string
    add_column :operators, :validator_signature, :string
    add_column :operators, :organizational_signature, :string
  end
end
