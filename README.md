## 概要

enPiT用の仮想環境を構築するための設定です．

## 起動

関連するRubyGemsのインストールと，レシピのインストール．

```bash
bundle install
berks install
```

VagrantにBerkshelfのプラグインを入れて起動．

```bash
vagrant plugin install vagrant-berkshelf
```

起動する．

```bash
vagrant up
```

Snapshotもとれるようにする（VBox用）．

```bash
vagrant plugin install vagrant-vbox-snapshot
vagrant snapshot take initial_snapshot
```

## Chefで取りこぼしたソフトウエアのインストール

hubと，rbenvへのGemのインストールがChefでうまくいかないので，
スクリプトを実行する．

```bash
vagrant ssh --command /vagrant/extra_provision.sh
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


# Tasks
## hubはホームにインストール済み
