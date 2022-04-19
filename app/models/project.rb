class Project < ApplicationRecord
  belongs_to :user

  serialize :contract_abi, Array

  CURRENT = self.first.try(:reload)
  DEFAULT_NAME = CURRENT.try(:name) || 'NFT'

  def connected_to_deployed_contract?
    (user.smart_contract.address && user.smart_contract.abi).present?
  end

  def network
    user.smart_contract.network
  end
end
