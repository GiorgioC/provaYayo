module InvitationCredits
  private

  def create_invitation_credits(recipient, event)
    #check if sender should receive credit on affiliate register
    if(recipient.invitation and !recipient.invitation.credit_used) and
      sender_credit_amount = Spree::Config["sender_credit_on_#{event}_amount".to_sym] and sender_credit_amount.to_f > 0
      credit = StoreCredit.create(:amount => sender_credit_amount,
                         :remaining_amount => sender_credit_amount,
                         :reason => "Invitation: #{event}", :user => recipient.invitation.sender)

      log_event recipient.invitation, recipient.invitation.sender, credit, event
    end

    ##check if affiliate should recevied credit on sign up
    #if recipient_credit_amount = Spree::Config["recipient_credit_on_#{event}_amount".to_sym] and recipient_credit_amount.to_f > 0
    #  credit = StoreCredit.create(:amount => recipient_credit_amount,
    #                     :remaining_amount => recipient_credit_amount,
    #                     :reason => "Invitation: #{event}", :user => recipient)
    #
    #  log_event recipient.invitation.sender, recipient.invitation.recipient, credit, event
    #end

  end

  def log_event(invitation, user, credit, event)
    invitation.events.create(:reward => credit, :name => event, :user => user)
  end

end
