Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '<Client ID here>', '<Client secret here>', {name: "google_login", approval_prompt: ''}
end
