raw_config = File.read(RAILS_ROOT + "/config/app_config.yml")
APP_CONFIG = YAML.load(raw_config)[RAILS_ENV].symbolize_keys

ActionMailer::Base.default_url_options[:host] = APP_CONFIG[:domain]

if APP_CONFIG[:smtp_settings]
  ActionMailer::Base.smtp_settings = {
     :address => APP_CONFIG[:smtp_settings]['address'],
     :port => APP_CONFIG[:smtp_settings]['port'],
     :domain => APP_CONFIG[:smtp_settings]['domain'],
     :authentication => APP_CONFIG[:smtp_settings]['authentication'],
     :user_name => APP_CONFIG[:smtp_settings]['user_name'],
     :password => APP_CONFIG[:smtp_settings]['password'],
     :tls => APP_CONFIG[:smtp_settings]['tls']
  }
end