module OmniauthProviders
  class Builder
    attr_reader :auth, :user
    private :auth, :user

    def initialize(auth, user)
      @auth = auth
      @user = user
    end

    def build
      UserProvider.create!(provider_attributes)
    end

    private

    def provider_attributes
      {
        provider: auth.provider,
        uid: auth.uid,
        user_id: user.id
      }
    end
  end
end
