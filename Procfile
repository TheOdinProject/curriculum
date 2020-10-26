release: bin/heroku_release
web: jemalloc.sh bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -c 2
