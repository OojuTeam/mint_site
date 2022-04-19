class MintController < ApplicationController
  before_action :maybe_onboard_user

  def index
    @project = Project::CURRENT
    @smart_contract = SmartContract::CURRENT
  end
end
