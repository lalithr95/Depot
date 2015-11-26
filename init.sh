export SECRET_KEY_BASE = $(bundle exec rake secret)
bundle exec rails db:create db:migrate
bundle exec rails server -b 0.0.0.0
#docker run --name web -d -p 3000:3000 --link db:pg lalithr95/depot
#docker run --name db -e POSTGRES_PASSWORD=password -e POSTGRES_USER=rails -d postgres