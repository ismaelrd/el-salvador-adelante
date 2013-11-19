Adelante::Application.configure do
    
  config.action_mailer.delivery_method = Config[:action_mailer][:delivery_method].to_sym
  
  config.action_mailer.smtp_settings = {
    :address => Config[:action_mailer][:smtp_settings][:address],
    :port => Config[:action_mailer][:smtp_settings][:port],
    :domain => Config[:action_mailer][:smtp_settings][:domain],
    :authentication => Config[:action_mailer][:smtp_settings][:authentication],
    :enable_starttls_auto => Config[:action_mailer][:smtp_settings][:enable_starttls_auto],
    :user_name => Config[:action_mailer][:smtp_settings][:user_name],
    :password => Config[:action_mailer][:smtp_settings][:password]
  }
  
end
