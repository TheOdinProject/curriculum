#!/bin/sh
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
rm -f tmp/pids/server.pid
bin/rails server -b 0.0.0.0

