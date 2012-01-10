class PromosController < Spree::BaseController
  before_filter :authenticate_user!
  def index
          # p  session[:omniauth].inspect
           #
           #user = FbGraph::User.fetch('me', :access_token => session[:omniauth]["credentials"]["token"])
           #@friends = user.friends
        #promo di oggi
        @todays_promos = Promotion.today
        @active_promos = Promotion.active_from_today
        #promo correnti
  end

end
