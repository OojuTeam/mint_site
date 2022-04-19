module Contractable
  extend ActiveSupport::Concern

  included do
    before_create :sanitize_contract_name
    before_create :sanitize_contract_symbol
    before_create :set_purchase_price
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
end
