# memo

## ベースのDockerイメージ作成

```sh
cd base
docker build -t ktakase00/rubypg-learn:uv-202002 -f Dockerfile.base .
```

## Railsプロジェクトの雛形作成

```sh
docker run --rm -v "$(pwd)":/home/ubuntu/repo ktakase00/rubypg-learn:uv-202002 /home/ubuntu/repo/bin/skeleton.sh
```

## uveats用Dockerイメージ作成

```sh
docker build -t ktakase00/rubypg-learn-uveats:uv-202002 .
```

## ロックファイル取り出し

```sh
docker run --rm -v "$(pwd)":/home/ubuntu/repo ktakase00/rubypg-learn-uveats:uv-202002 /home/ubuntu/repo/bin/lock.sh
```

## コンテナ起動

```sh
docker-compose up -d db
bin/docker_run_web.sh
```

## コンテナ停止

```sh
docker-compose down
```

## 準備

```sh
bundle exec rails generate rspec:install
bundle exec rails active_storage:install
bundle exec rails generate task uveats

bundle exec rails generate scaffold User mail:text user_name:text password_digest
bundle exec rails generate scaffold Menu menu_name:text price:bigint description:text image:text
bundle exec rails generate scaffold Order menu_id:bigint user_id:bigint delivery_address:text payment_method:text card_number:text

bundle exec rails generate controller sessions

bundle exec rails generate rspec:system User
bundle exec rails generate rspec:system Session
bundle exec rails generate rspec:system Menu
bundle exec rails generate rspec:system Order
```

## テスト用DB作成

```sh
RAILS_ENV=test bundle exec rails uveats:createdb
```
