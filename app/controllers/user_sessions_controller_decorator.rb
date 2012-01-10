UserSessionsController.class_eval do
  layout 'welcome_page'
  #after_filter :goto_welcome, :only => :create

  def new
    logger.debug (flash)
                        logger.debug (session)
    flash[:alert] =flash[:alert]
    redirect_to login_path
  end

  def create

    authenticate_user!



    if user_signed_in?
      respond_to do |format|
        format.html {
          flash[:notice] = I18n.t("logged_in_succesfully")
          if (session[:user_return_to])
            redirect_to session[:user_return_to]
          else
            redirect_back_or_default(offerte_path)
          end

        }
        format.js {
          user = resource.record
          render :json => {:ship_address => user.ship_address, :bill_address => user.bill_address}.to_json
        }
      end
    else
      #flash[:error] = I18n.t("devise.failure.invalid")
      logger.debug ("SONO PASSATO DI QUA")
      user = User.find_by_email(params[:user][:email])

      if(!user||user.confirmed?)
        redirect_to login_path  , :flash => { :alert=> I18n.t("devise.failure.invalid")}
      else
        redirect_to login_path  , :flash => { :alert=> I18n.t("devise.failure.unconfirmed")}
      end

    end
  end

end
