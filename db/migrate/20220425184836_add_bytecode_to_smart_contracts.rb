class AddBytecodeToSmartContracts < ActiveRecord::Migration[7.0]
  def change
    add_column :smart_contracts, :bytecode, :text
  end
end
