class AccountController < ApplicationController
  before_action :authenticate_user!

  def index
    @project = Project::CURRENT
    @smart_contract = SmartContract::CURRENT
  end

  def update
    current_user.update(account_update_params)
    sign_in(current_user, bypass: true) # prevents user from needing to log back in

    if Project::CURRENT.connected_to_deployed_contract?
      redirect_to account_index_path, notice: '계정 업데이트가 성공적으로 되었습니다'
    else
      redirect_to new_smart_contract_path
    end
  end

  private

  def account_update_params
    params.require(:user).permit(:email, :password)
  end
end
