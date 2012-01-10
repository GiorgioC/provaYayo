class Invitation < ActiveRecord::Base

  attr_accessible :sender_id, :recipient_email, :token, :sent_at
  belongs_to :sender, :class_name => 'User'
  has_one :recipient, :class_name => 'User'
  validates :recipient_email, :presence => true,
                    :length => {:minimum => 3, :maximum => 254},
                    :uniqueness => true,
                   :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  #validates_presence_of :recipient_email
  validate :recipient_is_not_registered
  #validate :sender_has_invitations, :if => :sender

  before_create :generate_token
  #before_create :decrement_sender_count, :if => :sender
  def recipient_bought?

      recipient.orders.complete.count>0 if recipient
  end
  private

  def recipient_is_not_registered
    errors.add :recipient_email, I18n.t('invitations.is_already_registered') if User.find_by_email(recipient_email)
  end

  def sender_has_invitations
    unless sender.invitation_limit > 0
      errors.add_to_base I18n.t('invitations.limit')
    end
  end

  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end


  def decrement_sender_count
    sender.decrement! :invitation_limit
  end

end
