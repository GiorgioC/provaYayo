class InvitationEvent < ActiveRecord::Base
  belongs_to :invitation
  belongs_to :reward, :polymorphic => true
  belongs_to :user
end