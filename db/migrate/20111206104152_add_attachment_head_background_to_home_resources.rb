class AddAttachmentHeadBackgroundToHomeResources < ActiveRecord::Migration
  def self.up
    add_column :home_resources, :head_background_file_name, :string
    add_column :home_resources, :head_background_content_type, :string
    add_column :home_resources, :head_background_file_size, :integer
    add_column :home_resources, :head_background_updated_at, :datetime
  end

  def self.down
    remove_column :home_resources, :head_background_file_name
    remove_column :home_resources, :head_background_content_type
    remove_column :home_resources, :head_background_file_size
    remove_column :home_resources, :head_background_updated_at
  end
end
