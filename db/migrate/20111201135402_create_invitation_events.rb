class CreateInvitationEvents < ActiveRecord::Migration
   def self.up
    create_table :invitation_events do |t|
      t.string :name
      t.integer :reward_id
      t.string :reward_type
      t.references :invitation
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :invitation_events
  end
end
