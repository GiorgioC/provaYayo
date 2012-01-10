UserRegistrationsController.class_eval do
 layout 'welcome_page'
 after_filter  :set_fb_after_invitation, :only=>:create
 before_filter :set_fb_before_invitation, :only=>:create

  def set_fb_before_invitation

    if params["s_e"]

      sender = User.find_by_email (params["s_e"])
      @invitation = Invitation.new(
                      :recipient_email=>params[:user][:email],
                      :sender_id => sender.id,
                      :sent_at => DateTime.now
                    )
      @invitation.save

    end
  end


  def set_fb_after_invitation
    if params["s_e"]

      if @invitation and @user
          @user.invitation_id = @invitation.id
          @user.save
      else
        p @invitation.errors.inspect
      end

    end

  end

end