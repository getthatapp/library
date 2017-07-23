OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {ssl: { 
        ca_file: '/usr/lib/ssl/certs/ca-certificates.crt',
        ca_path: "/etc/ssl/certs"}}}
end