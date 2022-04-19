class SmartContract < ApplicationRecord
  include Contractable
  belongs_to :user

  serialize :abi, Array

  CURRENT = self.first.try(:reload)

  # TODO: add eth testnets
  NETWORKS = %w(baobab klaytn matic maticmum ethereum)

  def deployed?
    (contract_address && contract_abi).present?
  end
end
