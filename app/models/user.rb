class User < ApplicationRecord
  after_create :set_admin
  has_many :orders
  has_many :books, through: :orders

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  private

  def set_admin
    if User.count == 1
      User.first.update_attribute(:admin, true)
    else
      return true
    end
  end
end