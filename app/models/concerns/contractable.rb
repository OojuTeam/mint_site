module Contractable
  extend ActiveSupport::Concern

  included do
    before_create :sanitize_contract_name
    before_create :sanitize_contract_symbol
    before_create :set_purchase_price
    after_create :compile!
  end

  def sanitize_contract_name
    self.name = self.name.gsub(' ', '').camelize # no spaces allowed
  end

  def sanitize_contract_symbol
    self.symbol = self.symbol.gsub(' ', '').upcase # no spaces allowed, should be caps
  end

  def set_purchase_price
    num_str = self.purchase_price_friendly.to_s

    case network
      when 'baobab', 'klaytn', 'matic', 'maticmum'
        18.times {|_| num_str << '0' }
      when 'ethereum'
        18.times {|_| num_str << '0' }
    end

    self.purchase_price = num_str.to_f
  end

  def solidity_server_base_uri
    'http://4x5v.hatchboxapp.com'
  end

  def compile!
    url = solidity_server_base_uri + '/contract_compilations'
    params = { name: name, purchase_price: purchase_price.round(0), mint_qty_max: mint_qty_max, creator_wallet_address: creator_wallet_address, symbol: symbol }
    resp = HTTParty.post(url, body: params)
    data = JSON.parse(resp.body)

    update(abi: data['abi'], bytecode: data['bytes'], source_code: data['source'])
  end

  def verify_and_check!
    verify!
    check!
  end

  def verify!
    url = solidity_server_base_uri + '/contract_verifications'
    params = attributes.slice('address', 'source_code', 'name', 'network')

    resp = HTTParty.post(url, body: params)
    data = JSON.parse(resp.body)

    update(verification_guid: data['result'])
  end

  def check!
    url = solidity_server_base_uri + '/contract_verifications?check=true'
    params = { network: network, guid: verification_guid }

    resp = HTTParty.post(url, body: params)
    data = JSON.parse(resp.body)

    update(verified: data['verified'])
  end
end
