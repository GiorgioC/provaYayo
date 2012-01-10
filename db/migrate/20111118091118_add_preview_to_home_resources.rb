class AddPreviewToHomeResources < ActiveRecord::Migration
  def change
    add_column :home_resources, :preview, :boolean
  end
end
