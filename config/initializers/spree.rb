Spree.config do |config|
  config.admin_interface_logo = "store/logo.png"
  config.allow_ssl_in_production = false
end

Spree.user_class = "Spree::User"
