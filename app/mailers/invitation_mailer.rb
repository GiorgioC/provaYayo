class InvitationMailer     < ActionMailer::Base

  # @param invitation [Object]
  # @param signup_url [Object]
  def invitation(invitation, signup_url)
    @signup_url = signup_url
    @invitation = invitation

    mail(:subject=>I18n.t('invitations.subject'),
          :recipients=> invitation.recipient_email ,
          :from=> YaYoCom::Application.config.invites_email)
    invitation.update_attribute(:sent_at, Time.now)


  end

end