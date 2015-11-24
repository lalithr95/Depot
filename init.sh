export SECRET_KEY_BASE = $(bundle exec rake secret)
bundle exec rails db:create db:migrate
bundle exec rails server -b 0.0.0.0