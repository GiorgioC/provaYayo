YaYoCom::Application.routes.draw do



  Mercury::Engine.routes
  resources :pages do
    member { post :mercury_update }
  end

  get "welcome/index"
  get "welcome/preview"
  get "welcome/facebook"



  match 'offerte' =>"promos#index"  ,:via=>:get
  match 'home'    => 'promos#index' , :via => :get
  match 'login'   => "welcome#index", :via => :get

  resources :invitations
  match '/invito/:invitation_token' =>"welcome#index",:as=>'invite'
  match '/facebook_connect' =>"welcome#facebook",:as=>'from_facebook'



  root :to => "promos#index"

  resources :yayo_experience ,:controller=>:posts, :as=>"posts"
  match "yayo_experience/blog/:tag_name" => "posts#tag", :as => "tag_posts"




  namespace :admin do
    #resource :cms_settings
    resources :posts


    resources :home_resources  do
         match 'publish' => 'home_resources#publish', :via => :get
         match 'preview' => 'home_resources#preview', :via => :get
         match 'clearimage/:scope' => 'home_resources#clearimage', :via => :delete,:as=>:clearimage
    end
  end



end
