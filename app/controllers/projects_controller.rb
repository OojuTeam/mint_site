class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_project

  def edit
    redirect_to new_smart_contract_path unless @project.connected_to_deployed_contract?
  end

  def update
    @project.update(project_params)
    redirect_to edit_project_path(@project.id), notice: 'Project updated successfully.'
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :bg_image_url, :sns_image_url, :launch_epoch)
  end

  def set_project
    @project = Project.find_by(user_id: current_user.id, id: params[:id])
  end
end
