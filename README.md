# 環境構築（バックエンド）
## Dockerイメージの構築〜コンテナ作成
```
docker compose build --no-cache
docker compose up -d
```

## Railsアプリケーションの作成（初回のみ）
```
docker-compose run api rails new . --api  --force --database=mysql
```

## DB作成〜マイグレーション
```
docker compose run --rm api rails db:create
docker-compose run --rm api rails db:migrate
```

## Seed作成
```
docker compose run --rm api rails db:seed
```

### 注意点
```
ActiveRecord::ConnectionNotEstablished: Can't connect to local server through socket '/run/mysqld/mysqld.sock' (2) (ActiveRecord::ConnectionNotEstablished)
```
上記のようなエラーが発生した場合、database.ymlに`host`,`username`,`password`のキーと値を追加してください。

## Rspecインストール
```
docker-compose run --rm api rails generate rspec:install
```

## 動作確認
http://localhost:3000 にアクセスし、Railsの初期ページが表示されることを確認

## バージョン
name | version
-- | --
Ruby | 3.2.6
Rails | 7.2.2
MySQL | 8.4
Redis | 7.4-alpine
