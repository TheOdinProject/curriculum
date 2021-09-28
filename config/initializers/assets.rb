# Be sure to restart your server when you modify this file.

# work around for segfault error with sassc that is appearing in CI for us atm - https://github.com/sass/sassc-ruby/issues/197
Rails.application.config.assets.configure do |env|
  env.export_concurrent = false
end

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.paths << Rails.root.join('app/assets/fonts')
