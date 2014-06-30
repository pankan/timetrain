class User < ActiveRecord::Base
	def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      GooglePlus.access_token = user.oauth_token
    
      user.activity = GooglePlus::Activity.get(111871732782220259822)
    
      user.save!
    end
  end

  def self.fetch_post
	
  	GooglePlus.access_token = oauth_token
  	activity = GooglePlus::Activity.get(111871732782220259822)
  	end
  end
end
