#!/bin/sh
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
bin/rails server -b 0.0.0.0

