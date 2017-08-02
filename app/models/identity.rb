class Identity < ApplicationRecord
  belongs_to :user

  def self.find_for_oauth(auth)
    identity = find_by(uid: auth[:uid])
    identity = create(uid: auth[:uid]) if identity.nil?
    identity.bio = auth[:info][:bio]
    identity.name = auth[:info][:name]
    identity.image = auth[:info][:image]
    identity.nickname = auth[:info][:nickname]
    identity.website = auth[:info][:website]
    identity.access_token = auth[:credentials][:token]
    identity
  end



end
