class SmartContractsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :instantiate_smart_contract, only: [:new, :create]
  skip_before_action :verify_authenticity_token, only: [:update, :verify, :check]

  def new
    @project = Project::CURRENT
    redirect_to edit_project_path(@project.id) if @project.connected_to_deployed_contract? # disable re-deployments
  end

  # user makes sure everything is OK, then clicks to deploy client-side and pays gas
  def show
    @smart_contract = SmartContract.find_by(user_id: current_user.id, id: params[:id])
  end

  def update
    @smart_contract = SmartContract::CURRENT
    @smart_contract.update(address: params[:contract_address]) if @smart_contract.address.blank? # disable re-deployments

    render json: { status: 'ok' }
  end

  def verifying
  end

  def verify
    @smart_contract = SmartContract::CURRENT
    @smart_contract.verify!

    render json: { status: 'ok' }
  end

  def check
    @smart_contract = SmartContract::CURRENT
    @smart_contract.check!

    render json: { status: 'ok', verified: @smart_contract.reload.verified }
  end

  def create
    @smart_contract.update(smart_contract_params)
    redirect_to smart_contract_path(@smart_contract.id), notice: 'Smart Contract created successfully.'
  end

  private

  def smart_contract_params
    params.require(:smart_contract).permit(:name, :symbol, :creator_wallet_address, :network, :mint_qty_max, :purchase_price_friendly)
  end

  def instantiate_smart_contract
    @smart_contract = SmartContract.new(user_id: current_user.id)
  end
end
