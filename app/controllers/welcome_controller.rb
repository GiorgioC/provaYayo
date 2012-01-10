class WelcomeController < Spree::BaseController
  caches_page :index, :expires_in=>10
  before_filter :authenticate_user!,:only=>[:token,:preview]
  layout 'welcome_page'
  def index
        store_location
        redirect_to root_path and return false  if current_user
        @user = User.new(:invitation_token => params[:invitation_token])
        @user.email = @user.invitation.recipient_email if @user.invitation

        @home = HomeResource.where(:preview=>false).first
        @experiences = Post.publish.limit(10)
        render :unconfigured and return false if @home.nil?

        return true

  end

  def facebook
       return if !index
       @sender = params[:e]
       render :index
  end

  def preview
        @user = User.new
        @home = HomeResource.where(:preview=>true).first
        render :unconfigured if @home.nil?
        render :index  unless @home.nil?
  end
  def token
    
  end

  protected

  def setup

  end

end
