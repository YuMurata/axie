# javascriptの開発方法

> TODO
>
> そのうち清書する
> （めんどいからいいか

## 必要ツールのインストール

### Node.js
[docs/sync.md](./sync.md)の`npmのインストール`を参考にインストールする

### npm
[docs/sync.md](./sync.md)の`npmのインストール`を参考にインストールする

### web3.js
`npm`をインストール後に`npm ci`を実行する（多分）

### geth
* https://geth.ethereum.org/downloads/ から実行OSに対応するインストーラをダウンロードする
* ダウンロードしたインストーラを実行して、適当にnextを押してく

## プライベートネットワークの起動
`bash local_debug/start.sh`を実行することで8545番ポートを使ってネットワークを起動する。