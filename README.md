## 概要

enPiT用の仮想環境です．
Railsアプリを作成し，GitHub，Travis CI，Herokuと連携する設定を行い，Deployするscriptを同梱しています．

## 前提

- VirtualBox（4.2.18で動作確認）
  - https://www.virtualbox.org/
- Vagrantが使えること（v1.3.1で動作確認）
  - http://downloads.vagrantup.com/

## Host OSでの作業

### はじめの1回

Gust OSのイメージの作成と起動．１時間程度かかります．

```bash
$ vagrant up --provision
```

### 2回目以降

Gust OSと起動．

```bash
$ vagrant up
```

### SSH接続

Macの場合

```bash
$ vagrant ssh
```

Windowsの場合，Putty/TeraTermなどでSSH接続

host: localhost
port: 2222
user: vagrant
password: vagrant

## Guest OSでの作業

### 作業用ディレクトリ

Host OSは/vagrantディレクトリに，Gest OSのこのREADME.mdがあるディレクトリをマウントします．この下にあるworkディレクトリで作業してください．

```bash
cd /vagrant/work
```

### GitHubへのSSH公開鍵

GitHubへSSH公開鍵を登録していない場合は下記のコマンドを実行してください．

```bash
$ /vagrant/scripts/github-connect.sh
```

（このscriptは[Create and register an SSH key for your github account](https://gist.github.com/acoulton/1969779)から一部を改変したものです．）

## Railsアプリの自動生成

下記のコマンドを実行してください．

```
$ /vagrant/scripts/generate_rails.sh <app_name>
```

Heroku，Travis CIへのログインの後，アプリの生成が始まります．
