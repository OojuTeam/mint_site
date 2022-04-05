module MintHelper
  def purchase_with_token_name
    case Project::CURRENT.network
      when 'baobab', 'klaytn'
        'KLAY'
      when 'matic'
        'MATIC'
      when 'maticmum'
        'MATICMUM'
      when 'ethereum'
        'ETH'
    end
  end

  def network_transaction_base_uri
    case Project::CURRENT.network
      when 'baobab'
        'https://baobab.scope.klaytn.com/tx/'
      when 'klaytn'
        'https://scope.klaytn.com/tx/'
      when 'matic'
        'https://polygonscan.com/tx/'
      when 'maticmum'
        'https://mumbai.polygonscan.com/tx/'
      when 'ethereum'
        'https://etherscan.io/tx/'
    end
  end
end
