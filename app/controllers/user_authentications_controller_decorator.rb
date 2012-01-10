UserAuthenticationsController.class_eval do

  def update

      @user = User.find(params[:id])
    previous_email = @user.email

    authorize! :edit, @user, session[:user_access_token]

    @user.email = params[:user][:email]
    @user.accept_terms_and_privacy = params[:user][:accept_terms_and_privacy]

    if @user.save
      session[:user_access_token] = nil
      logger.info ("Appaerantly saved")
      sign_in(@user, :event => :authentication) unless current_user
      redirect_to   root_path
    else

      logger.error ("Not saved #{@user.errors.inspect}")
      #in base all'errore definisco il comportamento         anche se ActiveError non mi permette di capire bene il motivo dell'errore
      validator = User.validators_on(:email).find{|x|x.kind_of? ActiveRecord::Validations::UniquenessValidator}

      #ripristino l'email precedente, sono anonymous


      if @user.errors.include?(:email) and !@user.email.empty? and !(validator.validate_each User.new,:email,@user.email).nil?
        session[:user_access_token] = nil
        flash.now[:error] = I18n.t(:sign_in_to_associate_with_existing_email)
        render(:template => 'users/merge')
      else
        @user.email = previous_email
        render 'user_registrations/social_edit', :locals=>{:user=>@user,:omniauth=>session[:omniauth]}

      end
    end
  end


end
