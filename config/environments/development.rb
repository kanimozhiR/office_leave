Rails.application.configure do
  
     config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false
config.assets.compile = true
  # Show full error reports and disable caching.
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log
  config.allow_concurrency = true
  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load
 
  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.i18n.fallbacks = true
    config.assets.debug = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host:'localhost', port: '3000' }
#  config.action_mailer.perform_deliveries = true
 # config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"
  config.action_mailer.smtp_settings = {
     :authentication => :plain,
  :address => "smtp.mailgun.org",
  :port => 587,
  :domain => "MYDOMAIN.mailgun.org",
  :user_name => "postmaster@MYDOMAIN.mailgun.org",
  :password => "MYPASSWORD"
}
end
  #  ActionMailer::Base.smtp_settings = {
  #    :address => "smtp.sendgrid.net",
  #    :port => 587,
  #    :authentication => :plain,
  #    :user_name => SENDGRID_USERNAME,
  #    :password => SENDGRID_PASSWORD
  #  }
