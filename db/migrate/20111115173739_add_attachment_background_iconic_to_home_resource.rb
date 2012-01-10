class AddAttachmentBackgroundIconicToHomeResource < ActiveRecord::Migration
  def self.up
    add_column :home_resources, :background_file_name, :string
    add_column :home_resources, :background_content_type, :string
    add_column :home_resources, :background_file_size, :integer
    add_column :home_resources, :background_updated_at, :datetime
    add_column :home_resources, :iconic_file_name, :string
    add_column :home_resources, :iconic_content_type, :string
    add_column :home_resources, :iconic_file_size, :integer
    add_column :home_resources, :iconic_updated_at, :datetime
  end

  def self.down
    remove_column :home_resources, :background_file_name
    remove_column :home_resources, :background_content_type
    remove_column :home_resources, :background_file_size
    remove_column :home_resources, :background_updated_at
    remove_column :home_resources, :iconic_file_name
    remove_column :home_resources, :iconic_content_type
    remove_column :home_resources, :iconic_file_size
    remove_column :home_resources, :iconic_updated_at
  end
end
