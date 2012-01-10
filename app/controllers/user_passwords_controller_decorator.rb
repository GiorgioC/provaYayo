UserPasswordsController.class_eval do
  layout 'messages'
  def create

        resource = User.find_by_email(params[:user][:email])
        if(resource)
          mm = User.included_modules.detect{|i| i ==Devise::Models::Recoverable}.instance_method(:send_reset_password_instructions)
          #resource = resource_class.new(params[resource_name])
          #self.resource = resource_class.send_reset_password_instructions(params[resource_name])
          mm.bind(resource).call

          @user = resource

        else
          flash[:error] =I18n.t(:forgot_password_not_present)
        end

        if resource and  resource.errors.empty?
          set_flash_message(:notice, :send_instructions) if is_navigational_format?
          respond_with resource, :location => login_path
        else
          respond_with_navigational(resource){ render_with_scope :new }
        end
  end

end