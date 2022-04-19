class SmartContractsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_smart_contract, except: [:show, :update]
  skip_before_action :verify_authenticity_token, only: [:update]

  def new
    @project = Project::CURRENT
    redirect_to edit_project_path(@project.id) if @project.connected_to_deployed_contract? # disable re-deployments
  end

  # user makes sure everything is OK, then clicks to deploy client-side and pays gas
  def show
    @smart_contract = SmartContract.find_by(user_id: current_user.id, id: params[:id])
    setup_deployment
  end

  def update
    @smart_contract = SmartContract::CURRENT
    @smart_contract.update(address: params[:contract_address]) if @smart_contract.address.blank? # disable re-deployments

    render json: { status: 'ok' }
  end

  def create
    @smart_contract.update(smart_contract_params)
    redirect_to smart_contract_path(@smart_contract.id), notice: 'Smart Contract created successfully.'
  end

  private

  def smart_contract_params
    params.require(:smart_contract).permit(:name, :symbol, :creator_wallet_address, :network, :mint_qty_max, :purchase_price_friendly)
  end

  # compiles contract with Ruby https://github.com/q9f/eth.rb/#28-solidity-compiler-bindings
  # TODO: move to service object, rename tmp files
  def setup_deployment
    file = File.read("#{Rails.root}/MintSite.sol")

    file.gsub!('MINT_PRICE = 1000000000000000000', "MINT_PRICE = #{@smart_contract.purchase_price.round(0)}")
    file.gsub!('MAX_PURCHASE_LIMIT = 10', "MAX_PURCHASE_LIMIT = #{@smart_contract.mint_qty_max}")
    file.gsub!('payable(0x0000000000000000000000000000000000000000)', "payable(#{@smart_contract.creator_wallet_address})");
    file.gsub!('MintSiteContractName', @smart_contract.name);
    file.gsub!('MintSiteContractSymbol', @smart_contract.symbol);

    File.open("MintSiteStaging.sol", "w") { |f| f.write file }

    solc = Eth::Solidity.new
    raw_contract = solc.compile 'MintSiteStaging.sol'

    contract = raw_contract[@smart_contract.name]
    @abi = contract['abi']
    @bytes = contract['bin']

    @smart_contract.update(abi: @abi)
  end

  def set_smart_contract
    @smart_contract = SmartContract.new(user_id: current_user.id)
  end
end
