User.class_eval do
  attr_accessible :accept_terms_and_privacy , :invitation_token

  validates_inclusion_of :accept_terms_and_privacy, :message => t(:registration_terms_required),:in=>[true,1],:if =>Proc.new {|user|!user.anonymous? }

   #validates_uniqueness_of :invitation_id

  has_many :sent_invitations, :class_name => 'Invitation', :foreign_key => 'sender_id'
  belongs_to :invitation


  devise :database_authenticatable, :token_authenticatable, :registerable, :recoverable,:confirmable,
         :rememberable, :trackable, :validatable, :encryptable, :encryptor => "authlogic_sha512"

  def invitation_token
    invitation.token if invitation
  end

  def invitation_token=(token)
    self.invitation = Invitation.find_by_token(token)
  end
  #
  #def  send_confirmation_instructions
  #  logger.debug ("Calling overidden")v
  #end

end