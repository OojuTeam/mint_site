class DropProjectAttrs < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :mint_qty_default
    remove_column :projects, :mint_qty_max
    remove_column :projects, :purchase_price
    remove_column :projects, :purchase_price_friendly
    remove_column :projects, :network
    remove_column :projects, :contract_address
    remove_column :projects, :contract_abi
  end
end
