# == Schema Information
#
# Table name: settings
#
#  id         :integer          not null, primary key
#  var        :string           not null
#  value      :text
#  thing_id   :integer
#  thing_type :string(30)
#  created_at :datetime
#  updated_at :datetime
#

class Settings < RailsSettings::CachedSettings

  def self.installed?
    !!self.password_digest
  end

  def self.authenticate(unencrypted_password)
    return unless self.password_digest
    BCrypt::Password.new(self.password_digest).is_password?(unencrypted_password) && self
  end

  def self.password=(unencrypted_password)
    if unencrypted_password.nil?
      self.password_digest = nil
    elsif !unencrypted_password.empty?
      @password = unencrypted_password
      self.password_digest = BCrypt::Password.create(unencrypted_password, cost: BCrypt::Engine.cost)
    end
  end

  def self.application_keys
    %w(
      imgur_client_id
      imgur_client_secret
      imgur_access_token
      imgur_refresh_token
      estimote_app_id
      estimote_app_token
      kontakt_api_key
    )
  end
end
