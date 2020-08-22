RSpec.configure do
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
    provider: 'github',
    uid: '123',
    info: {
      image: 'http://github.com/fake-avatar'
    }
  )
end
