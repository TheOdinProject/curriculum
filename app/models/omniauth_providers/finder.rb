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
      if omniauth_provider_exists?
        omniauth_provider
      else
        new_user_provider
      end
    end

    private

    def omniauth_provider
      @omniauth_provider ||= find_omniauth_provider
    end
    alias_method :omniauth_provider_exists?, :omniauth_provider

    def find_omniauth_provider
      UserProvider.where(provider: auth.provider, uid: auth.uid).first
    end

    def new_user_provider
      Builder.new(auth, user).build
    end

    def user
        User.where(email: auth.info.email.downcase).first_or_create! do |user|
          user.username = auth.info.name
          user.email = auth.info.email.downcase
          user.password = Devise.friendly_token[0,20]
          user.avatar = auth.info.image
        end
      rescue ActiveRecord::RecordInvalid
        ::NewRelic::Agent.add_custom_attributes(auth)
        raise
    end
  end
end
