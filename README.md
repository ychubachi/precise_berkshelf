## 概要

enPiT用の仮想環境を構築するための設定です．

## 起動

関連するRubyGemsのインストールと，レシピのインストール．

```bash
bundle install
berks install
```

Vagrantにプラグインを入れて起動．

```bash
vagrant plugin install vagrant-berkshelf
vagrant up
```

## Amazon S3へのdeploy

s3cmdをインストール

```bash
sudo apt-get install s3cmd
```

AWSのKeyとSecretを登録

```bash
s3cmd --configure
```

スクリプトの実行

```bash
deploy.sh
```
