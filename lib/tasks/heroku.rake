# https://github.com/heroku/heroku-buildpack-ruby/pull/892#issuecomment-640900787
namespace :yarn do
  task install: :environment do
    # don't run if webpacker doesn't need to run
    next unless Webpacker::Instance.new.compiler.stale?

    # These yarn settings come from the nodejs buildpack
    # https://github.com/heroku/heroku-buildpack-nodejs/blob/02af461e42c37e7d10120e94cb1f2fa8508cb2a5/lib/dependencies.sh
    yarn_flags = '--production=false --frozen-lockfile --ignore-engines --prefer-offline --cache-folder=~/.cache/yarn'

    puts '*** [yarn:install] Configuring yarn with all build dependencies'
    command = "yarn install #{yarn_flags}"
    puts "Running: #{command}"
    system command
  end
end
