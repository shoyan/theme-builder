# site-generator
This is prototype site generator api.

## Getting Started
Dockerを使って簡単に開発環境を作れます。  
以下のページより、Docker Toolboxをインストールしてください。  
https://www.docker.com/products/docker-toolbox

インストールが完了したら、アプリケーションにDocker Quickstart Terminalがインストールされています。  
クリックするとDockerを起動することができます。

以下の手順でDockerコンテナを起動します。
```
$ git clone git@git.pepabo.com:shoyan/site-generator.git
$ cd site-generator

# dockerコンテナを起動する
$ docker-compose up -d

# ipアドレスを確認します
$ docker-machine  ip
192.168.99.100
```
表示されたIPにブラウザでアクセスしてHello world!と表示されれば成功です。  

### サイトを作成する
https://192.168.99.100:4567/build にアクセスします。  
フォームに設定項目を入力して作成ボタンを押してください。  
作成されたサイトが表示されます。  
ファイルは`public-html`配下に作成されます。

### Dockerコンテナの操作

Dockerコンテナの一覧を表示する
```
$ docker-compose ps
```

Dockerコンテナを再起動する
```
$ docker-compose restart
```

Dockerコンテナを停止する
```
$ docker-compose stop
```

Dockerコンテナを削除する
```
$ docker-compose down
```
