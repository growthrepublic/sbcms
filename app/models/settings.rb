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

  class << self
    def application_keys
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

    def authenticate(unencrypted_password)
      return unless self.password_digest

      BCrypt::Password.new(self.password_digest).is_password?(unencrypted_password)
    end

    def store_password(unencrypted_password)
      if unencrypted_password.nil?
        self.password_digest = nil
      elsif !unencrypted_password.empty?
        self.password_digest = BCrypt::Password.create(unencrypted_password, cost: BCrypt::Engine.cost)
        self.configuration_finished = true
      end
    end

    def update_with_password(params)
      self.store_password(params.delete :password)

      params.each do |key, value|
        Settings[key] = value
      end
    end
  end
end
