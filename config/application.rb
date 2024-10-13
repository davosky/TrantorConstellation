require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module TrantorConstellation
  class Application < Rails::Application
    config.load_defaults 7.0

    config.i18n.default_locale = :it
    config.time_zone = "Europe/Rome"
    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    config.generators do |g|
      g.assets false
      g.helper false
      g.test_framework nil
      g.jbuilder false
    end
  end
end
