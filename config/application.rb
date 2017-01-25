require_relative 'boot'

require 'rails/all'
require 'multi_json'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LungeDe
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # serve compressed content
    config.middleware.use Rack::Deflater

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Berlin'

    # simple_calendar options
    config.beginning_of_week = :monday

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = :de

    # Enable the asset pipeline
    config.assets.enabled = true

    # add ionicons iconfont to asset pipline
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

    # use the rails router to handle custom error pages
    config.exceptions_app = self.routes

    # Action Mailer setup
    config.action_mailer.delivery_method = :smtp

    config.action_mailer.smtp_settings = {
      address: "smtp.gmail.com",
      port: 587,
      domain: ENV["GMAIL_DOMAIN"],
      authentication: "login",
      enable_starttls_auto: true,
      user_name: ENV["GMAIL_USERNAME"],
      password: ENV["GMAIL_PASSWORD"]
    }

    # background jobs backend
    config.active_job.queue_adapter = :delayed_job

    # Jbuilder
    MultiJson.use :yajl

    # remove trailing slashes in URLs
    config.action_controller.default_url_options = { trailing_slash: false }
    config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
      r301 %r{^/(.*)/$}, '/$1'
    end
  end
end
