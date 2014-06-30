json.array!(@users) do |user|
  json.extract! user, :id, :name, :provider, :oauth_token
  json.url user_url(user, format: :json)
end
