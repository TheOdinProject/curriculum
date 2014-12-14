# Theodinproject::Application.config.secret_token = '98ade6b9ffb18c112978067bcf1c875f107157451c46b7a2ed2c43b94577d0548e8ecba91f3ac4bc18649306fa35066b085821a055e26e9d97e641461c9030cd'
Theodinproject::Application.config.secret_key_base = 'xx98ade6b9ffb18c112978067bcf1c875f107157451c46b7a2ed2c43b94577d0548e8ecba91f3ac4bc18649306fa35066b085821a055e26e9d97e641461c9030cd'

# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

# from Hartl tutorial Listing 3.2 - http://ruby.railstutorial.org/chapters/static-pages
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use existing token
    File.read(token_file).chomp
  else
    # Generate token and store in token_file
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Theodinproject::Application.config.secret_token = secure_token
