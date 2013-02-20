class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :refresh_token, :access_token, :expires

  validates_uniqueness_of :uid, :scope => :provider

  def self.create_or_ensure_omniauth(auth)
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || create! do |u|
      u.provider = auth["provider"]
      u.uid = auth["uid"]
      u.refresh_token = auth["refresh_token"]
    end
    user.access_token = auth["token"]
    user.expires = auth["expires_at"]
    user.name = auth["info"]["name"]
    user
  end
end
