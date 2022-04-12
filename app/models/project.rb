class Project < ApplicationRecord
  belongs_to :user

  serialize :contract_abi, Array

  CURRENT = self.first.try(:reload)
  DEFAULT_NAME = CURRENT.try(:name) || 'NFT'

  NETWORKS = %w(baobab klaytn matic maticmum ethereum)

  def ready?
    (launch_epoch && mint_qty_default && mint_qty_max && network && purchase_price_friendly && purchase_price && contract_address && contract_abi).present?
  end
end
