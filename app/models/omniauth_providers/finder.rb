module OmniauthProviders
  class Finder
    attr_reader :auth
    private :auth

    def initialize(auth)
      @auth = auth
    end

    def self.find(auth)
      new(auth).find
    end

    def find
      return omniauth_provider if omniauth_provider.present?

      new_user_provider
    end

    private

    def omniauth_provider
      @omniauth_provider ||= UserProvider.where(provider: auth.provider, uid: auth.uid).first
    end

    def new_user_provider
      Builder.new(auth, user).build
    end

    # rubocop:disable Metrics/AbcSize
    def user
      User.where(email: auth.info.email.downcase).first_or_create! do |user|
        user.username = auth.info.name
        user.email = auth.info.email.downcase
        user.password = Devise.friendly_token[0, 20]
        user.avatar = auth.info.image
      end
    end
    # rubocop:enable Metrics/AbcSize
  end
end
