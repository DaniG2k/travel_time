require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TravelTime
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'London'
    config.active_job.queue_adapter = :sidekiq
    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      "<div class=\"field error\">#{html_tag}</div>".html_safe
    end
  end
end
