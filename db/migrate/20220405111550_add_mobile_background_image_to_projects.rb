class AddMobileBackgroundImageToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :bg_image_url_mobile, :text
  end
end
