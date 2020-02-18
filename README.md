# UV Eats

## 1. サンプルプログラムについて

### 1.1 概要

サンプルプログラムUV Eatsは、Webサイト上で料理のメニューを注文すると配達してもらえる、というサービスであるとします。

* あらかじめ登録されているユーザでログインして利用します。
* メニュー一覧からひとつのメニューを選択して注文します。
* 注文時は配達先住所、支払方法、クレジットカード番号を入力します。

### 1.2 画面イメージ

![uveats_pages.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/27959/f9f34e6e-d43d-6d60-1aa9-530a2e60ead7.png)

## 2. 開発環境の構築

### 2.1 Gitリポジトリのクローン

```sh
git clone git@github.com:ktakase00/uveats_demo.git
```

### 2.2 webコンテナ用イメージ作成

```sh
docker pull ktakase00/rubypg-learn-uveats:uv-202002
```

## 3. 開発環境の起動

* 「開発環境の構築」の手順が完了しているとする。

### 3.1 dbコンテナ起動

```sh
docker-compose up -d db
```

### 3.2 webコンテナ起動

```sh
bin/docker_run_web.sh
```

→webコンテナ内でbashが実行された状態になる。

### 3.3 webコンテナ内プロジェクトルートパス設定

webコンテナ内で設定する。

```sh
export WEB_ROOT=~/repo/apps/web
```

### 3.4 初期設定

webコンテナ内で実行する。

```sh
cd $WEB_ROOT
./setup.sh
```

### 3.5 RSpec実行

webコンテナ内で実行する。

```sh
cd $WEB_ROOT
bundle exec rspec -fd spec/system
```

## 4. 開発環境の停止

1. webコンテナのbashを終了する。
2. 以下のコマンドを実行する。

```sh
docker-compose down
```

→コンテナが破棄される。
