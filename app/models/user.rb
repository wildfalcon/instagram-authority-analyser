class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_one :identity

  def instagram_client
    raise Exceptions::InstagramError.new("No identity") if identity.nil?
    @instagram_client ||= Instagram.client( access_token: identity.access_token)
  end

end
