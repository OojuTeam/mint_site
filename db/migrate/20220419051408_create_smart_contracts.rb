class CreateSmartContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :smart_contracts do |t|
      t.string :name
      t.string :symbol
      t.string :creator_wallet_address
      t.decimal :purchase_price
      t.integer :purchase_price_friendly
      t.integer :mint_qty_max
      t.string :network
      t.string :address
      t.string :abi
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
