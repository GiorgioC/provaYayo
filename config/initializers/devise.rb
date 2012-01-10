Devise.setup do |config|
  config.mailer_sender = "noreply@yayo.com"
  config.omniauth :facebook, "191619410919383", "9c18224bf866a796ed2fc482c6104f26"
  config.reset_password_within = 2.hours
  config.confirm_within = 2.days
end


