class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.bigint :launch_epoch
      t.integer :mint_qty_default
      t.integer :mint_qty_max
      t.decimal :purchase_price
      t.integer :purchase_price_friendly
      t.string :network
      t.string :contract_address
      t.string :contract_abi
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
