FactoryBot.define do
  factory :project do
    name { "MyString" }
    launch_epoch { "" }
    default_mint_qty { "MyString" }
     { 1 }
    max_mint_qty { 1 }
    purchase_price_friendly { 1 }
    network { "MyString" }
    purchase_price { "" }
    contract_address { "MyString" }
    contract_abi { "MyString" }
    user { nil }
  end
end
