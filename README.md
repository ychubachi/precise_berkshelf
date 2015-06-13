## 概要

enPiT用の仮想環境を構築するための設定です．

## 準備

- Vagrant
- VirtualBox
- Chef DK

## Vagrantのプラグイン
VagrantにChef，Berkshelfのプラグインを入れる．

```bash
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-berkshelf
```

Snapshotもとれるようにする（VBox用）．

```bash
vagrant plugin install vagrant-vbox-snapshot
```

Snapshotの取り方．

```bash
vagrant snapshot take initial_snapshot
```

## 起動

レシピのインストール．

```bash
berks install
```

起動する．

```bash
vagrant up
```

## Chefで取りこぼしたソフトウエアのインストール

hubと，rbenvへのGemのインストールがChefでうまくいかないので，
スクリプトを実行する．

```bash
vagrant ssh --command /vagrant/extra_provision.sh
```

## Amazon S3の設定

デプロイするために、s3cmdをインストール

```bash
sudo apt-get install s3cmd
```

AWSのKeyとSecretを登録

```bash
s3cmd --configure
```

## スクリプト
以上を行うスクリプトを用意した．

```bash
deploy.sh
```


## Box の登録先

- [Vagrant box ychubachi/enpit | Atlas by HashiCorp](https://atlas.hashicorp.com/ychubachi/boxes/enpit)

