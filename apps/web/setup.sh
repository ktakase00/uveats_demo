cp -p config/master.key.dev config/master.key
ln -s ${HOME}/cabin/web/node_modules .
bundle exec rails yarn:install
bundle exec rails uveats:createdb
RAILS_ENV=test bundle exec rails uveats:createdb
bundle exec rails db:migrate
bundle exec rails db:seed
