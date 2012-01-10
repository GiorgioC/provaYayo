OmniauthCallbacksController.class_eval do
  append_after_filter :set_omni



  def set_omni
      session[:omniauth] = request.env["omniauth.auth"] if request.env["omniauth.auth"]
  end
end