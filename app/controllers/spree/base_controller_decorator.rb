Spree::BaseController.class_eval do
  before_filter :menu_items
  #before_filter :authenticate_user! ,:except

  def menu_items

        @menu = [
        { :name => t(:menu_vetrina), :link => '/offerte'},
        { :name => t(:menu_account), :link => '/account' },
        { :name => t(:menu_help), :link => '/help' },
        { :name => t(:menu_blog), :link => '/yayo_experience' },
        { :name => t(:menu_invite), :link => '/invitations' } ]


  end
end