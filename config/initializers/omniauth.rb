OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '640073172800802', 'ce2eeeeda9d53eb42a03de98ad28a0a9'
end