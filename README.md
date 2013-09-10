## 概要
enPiT用の仮想環境です．
Railsアプリを作成し，GitHub，Travis CI，Herokuと連携する設定を行い，Deployするscriptを同梱しています．

## 前提

- VirtualBox/Vagrantが使えること
- [Heroku Toolbelt](https://toolbelt.heroku.com/)がインストールされていること
- [github/hub](https://github.com/github/hub)がインストールされていること

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

## Guest OS

## GitHubへのSSH公開鍵

GitHubへSSH公開鍵を登録していない場合は下記のコマンドを実行してください．

```bash
$ wget https://gist.github.com/acoulton/1969779/raw/5b24fc88fb978f6fec89196903432a94aa1c209b/github-connect.sh
$ chmod 755 github-connect.sh
$ ./github-connect.sh
```

（このscriptは[Create and register an SSH key for your github account](https://gist.github.com/acoulton/1969779)から一部を改変したものです．）

## Railsアプリの自動生成

下記のコマンドを実行してください．

```
$ mkdir -p /vagrant/work
$ cd /vagrant/work
$ git clone git@github.com:ychubachi/rails_github_travis_heroku.git
$ cd rails_github_travis_heroku
$ ./generate_rails.sh <app_name>
```

Heroku，Travis CIへのログインの後，アプリの生成が始まります．
