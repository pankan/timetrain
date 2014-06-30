
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, 'KFmY7FZfHs4nPCsuerXj61isy', 'K3z9WkgHN2uAbppe7MaYRyyLJf1lCVHWHPtVpEtyyCSJFpYCHb'
end