class AddSourceCodeToSmartContracts < ActiveRecord::Migration[7.0]
  def change
    add_column :smart_contracts, :source_code, :text
  end
end
