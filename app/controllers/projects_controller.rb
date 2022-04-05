class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_project

  def edit
  end

  def update
    strong_params = project_params.to_h
    abi_params = YAML.load(params[:project][:contract_abi][0])
    @project.update(strong_params.merge('contract_abi' => abi_params))

    redirect_to edit_project_path(@project.id), notice: 'Project updated successfully.'
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :bg_image_url, :sns_image_url, :launch_epoch, :mint_qty_default, :mint_qty_max, :purchase_price, :purchase_price_friendly, :network, :contract_address)
  end

  def set_project
    @project = Project.find_by(user_id: current_user.id, id: params[:id])
  end
end
