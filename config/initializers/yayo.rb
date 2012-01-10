
#
#User.class_eval do
#  validates_presence_of :accept_terms_and_privacy, :message => t(:registration_terms_required)
#  devise :database_authenticatable, :token_authenticatable, :registerable, :recoverable,:confirmable,
#         :rememberable, :trackable, :validatable, :encryptable, :encryptor => "authlogic_sha512"
#end
#
#
#Spree::BaseController.class_eval do
#  before_filter :menu_items
#  before_filter :authenticate_user!
#
#  def menu_items
#        puts "\n\n\nCI SONO IO|||||||||||||||||||||||||||||||||||||*********************************************"
#        @menu = {
#        :vetrina => { :name => t(:menu_vetrina), :link => '/home'},
#        :account => { :name => t(:menu_account), :link => '/groups' },
#        :help => { :name => t(:menu_help), :link => '/projects' },
#        :blog=> { :name => t(:menu_blog), :link => '/settings' },
#        :invite => { :name => t(:menu_invite), :link => '/about' }}
#        @current_uri = request.env['PATH_INFO']
#      puts "\n\n\nCI SONO IO|||||||||||||||||||||||||||||||||||||*********************************************"
#  end
#end

if Spree::Config.instance
  Spree::Config.set :sender_credit_on_invited_purchased_amount =>50
end


