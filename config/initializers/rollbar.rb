require 'rollbar/rails'
Rollbar.configure do |config|
  config.access_token = ENV['ROLLBAR_ACCESS_TOKEN']

  if Rails.env.test?
    config.enabled = false
  end

  if Rails.env.development?
    config.enabled = false
  end

  config.person_method = "current_spree_user"
  config.person_username_method = "login"
end
