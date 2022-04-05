class AddSnsImageUrlToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :sns_image_url, :text
  end
end
