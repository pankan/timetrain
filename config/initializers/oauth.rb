Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, 
    Rails.configuration.secrets['omniauth-google-oauth2-example']['login_auth_client_id'],
    Rails.configuration.secrets['omniauth-google-oauth2-example']['login_auth_client_secret'],
    {name: "google_login", approval_prompt: ''}
end
