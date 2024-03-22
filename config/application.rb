require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RoommaticPc244
  class Application < Rails::Application
    config.load_defaults 7.1

    config.generators.jbuilder = false

    config.autoload_lib(ignore: %w(assets tasks))
  end
end
