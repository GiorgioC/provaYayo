class ChangeDateFormatInUsers < ActiveRecord::Migration
  def up
     change_column :users, :confirmation_sent_at, :datetime
     change_column :users, :confirmed_at, :datetime
  end

  def down
  end
end
