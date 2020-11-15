#!/bin/sh
bin/rails db:environment:set RAILS_ENV=development
bin/rails db:reset
rm -f tmp/pids/server.pid
bin/rails server -b 0.0.0.0
