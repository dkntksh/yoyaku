# README

# 環境構築

## docker-compose

```
# build
docker-compose build

# webpackerのインストール
docker-compose run web bundle exec rails webpacker:install

# コンテナの起動
docker-compose up -d

# DB作成
docker-compose run web rails db:create

```