class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    resource.needs_to_activate? ? account_index_path : edit_project_path(Project::CURRENT.id)
	end

  def authenticate_admin!
    redirect_to root_path unless current_user.admin?
  end

  def maybe_onboard_user
    if User.first.needs_to_activate?
      sign_in(User.first)
      redirect_to account_index_path
    end
  end
end
