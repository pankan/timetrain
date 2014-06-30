class User < ActiveRecord::Base

	 def self.create_with_omniauth(auth)
    create! do |user|
      user.access_token = auth["credentials"]["token"]
      user.access_secret = auth["credentials"]["secret"]
      user.name = auth["info"]["nickname"]
    end
  end

end
