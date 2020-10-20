release: bin/rails db:migrate
web: jemalloc.sh bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -c 2
