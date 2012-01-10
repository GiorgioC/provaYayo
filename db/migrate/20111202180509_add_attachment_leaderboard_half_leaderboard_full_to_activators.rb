class AddAttachmentLeaderboardHalfLeaderboardFullToActivators < ActiveRecord::Migration
  def self.up
    add_column :activators, :leaderboard_file_name, :string
    add_column :activators, :leaderboard_content_type, :string
    add_column :activators, :leaderboard_file_size, :integer
    add_column :activators, :leaderboard_updated_at, :datetime
    add_column :activators, :half_leaderboard_file_name, :string
    add_column :activators, :half_leaderboard_content_type, :string
    add_column :activators, :half_leaderboard_file_size, :integer
    add_column :activators, :half_leaderboard_updated_at, :datetime
    add_column :activators, :full_file_name, :string
    add_column :activators, :full_content_type, :string
    add_column :activators, :full_file_size, :integer
    add_column :activators, :full_updated_at, :datetime
  end

  def self.down
    remove_column :activators, :leaderboard_file_name
    remove_column :activators, :leaderboard_content_type
    remove_column :activators, :leaderboard_file_size
    remove_column :activators, :leaderboard_updated_at
    remove_column :activators, :half_leaderboard_file_name
    remove_column :activators, :half_leaderboard_content_type
    remove_column :activators, :half_leaderboard_file_size
    remove_column :activators, :half_leaderboard_updated_at
    remove_column :activators, :full_file_name
    remove_column :activators, :full_content_type
    remove_column :activators, :full_file_size
    remove_column :activators, :full_updated_at
  end
end
