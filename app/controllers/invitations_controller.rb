class InvitationsController < Spree::BaseController
  respond_to :html, :js,:json
  before_filter :authenticate_user!
  def index
    @invitations = current_user.sent_invitations
    @invitation = Invitation.new
    if session[:omniauth] and session[:omniauth]["provider"]=="facebook"
        @api_key = AuthenticationMethod.where(:environment=>::Rails.env ,:active=>true).find{|f|f.preferred_provider=="facebook"}.preferences["api_key"]
        user = FbGraph::User.fetch('me', :access_token => session[:omniauth]["credentials"]["token"])
        @friends = user.friends

    end
  end

  def new
    @invitation = Invitation.new
  end


  def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.sender = current_user
    if @invitation.save
      logger.debug("******* OK SAVIED *******")
      InvitationMailer.invitation(@invitation,invite_url(@invitation.token)).deliver
      @invitations = current_user.sent_invitations
      logger.debug("******* INVITATIONS *******")
      logger.debug(@invitations.inspect)
    logger.debug("******* INVITATIONS *******")
      flash[:notice] = I18n.t(:invitation_sent)
      respond_with do |format|
        format.html{
          index
          render :action=>:index
        }
        format.js{

          render :create
        }


      end
    else

      respond_with do |format|
        format.html{

          render :action => 'new'
        }
        format.js{

           render 'create'
        }

     end

       end


  end



end
