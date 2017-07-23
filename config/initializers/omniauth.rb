OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {ssl: {ca_file: Rails.root.join('lib/assets/cacert.pem').to_s}}}
  # , skip_jwt: true
end