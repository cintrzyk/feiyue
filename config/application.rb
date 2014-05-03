require File.expand_path('../boot', __FILE__)
require 'rails/all'
require 'dotenv'
Dotenv.load

Bundler.require(:default, Rails.env)

module Feiyue
  class Application < Rails::Application

    config.to_prepare do
      # Load application's model / class decorators
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      # Load application's view overrides
      Dir.glob(File.join(File.dirname(__FILE__), "../app/overrides/*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.time_zone = 'Amsterdam'
    I18n.enforce_available_locales = true
    config.i18n.default_locale = :nl
  end
end
