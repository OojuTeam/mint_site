class AddVerificationAttrsToSmartContracts < ActiveRecord::Migration[7.0]
  def change
    add_column :smart_contracts, :verification_guid, :text
    add_column :smart_contracts, :verified, :boolean, default: false
  end
end
