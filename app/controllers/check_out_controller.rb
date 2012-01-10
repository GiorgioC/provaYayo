CheckOutController.class_eval do

  include InvitationCredits

  private

  def after_complete
    session[:order_id] = nil

    if current_user && current_user.invitation && !current_user.invitation.credit_used && current_user.orders.where(:state => 'complete').count == 1
      sender = current_user.invitation.sender
      create_invitation_credits( current_user, "invited_purchased")
    end
  end


end