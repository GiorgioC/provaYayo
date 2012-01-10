if Spree::Config.instance
  Spree::Config.set :default_locale =>:it
  Spree::Config.set :allow_locale_switching =>false
end