## 概要

enPiT用の仮想環境を構築するための設定です．

## Amazon S3へのdeploy

```bash
vagrant up
vagrant package
s3cmd put package.box s3://vagrant-enpit
```

## 注意

packagingのまえに，~/.sshなどが含まれていないことを確認すること．
