# ローカルのプロジェクトと同期
* 参考: https://qiita.com/3tomcha/items/37a851a0280060682f66

web上でも完結できるけどローカルにファイルを残しておきたいので同期させる

### npmのインストール
* 参考: https://qiita.com/taiponrock/items/9001ae194571feb63a5e

1. https://nodejs.org/ja/download/ からOSに合わせたインストーラをダウンロードする
   * 2021/07/30時点では以下のバージョンをダウンロードした
     * node: v14.17.3
     * npm: 6.14.13
   * 以下windowsでインストールすることを想定
   * 他OSは知らん
1. ダウンロードしたインストーラを実行してnodeとnpmをインストールする
   * 適当に「Next」をクリック
1. インストール出来たらコマンドプロンプトかpower shellを開く
1. 以下のコマンドを実行してインストール出来ていることを確認する
   ``` bash
   node -v
   # v14.17.3
   npm -v
   # 6.14.13
   ```

### remixdのインストール
* 参考: https://github.com/ethereum/remixd

1. コマンドプロンプトかpower shellを開く
1. 以下のコマンドを実行してremixdをインストールする
   ``` bash
   npm install -g @remix-project/remixd
   ```
1. 以下のコマンドを実行してインストール出来ていることを確認する
   ``` bash
   remixd -v
   # 0.5.0
   ```

### プロジェクトの作成
1. 作業ディレクトリに移動する
1. `git clone <後で書く>`でリポジトリを持ってくる
   * gitのインストールは省略、自分で調べて

### remixdの起動
1. コマンドプロンプトかpower shellを開く
1. 以下のコマンドを実行してremixdを起動する
   ``` bash
   remixd -s <プロジェクトのパス> --remix-ide https://remix.ethereum.org
   # いろいろ表示される
   # 同期中はremixdを終了してはいけない
   ```

### ブラウザから連携する
1. ブラウザから https://remix.ethereum.org にアクセスする
1. 左上の`Workspaces`のリストボックスから`connect localhost`的なのを選ぶ
   * 2021/07/30時点での操作方法
   * web IDE のバージョン変わったら操作方法変わるかも
1. いろいろ言われるから`ok`とか`connect`的なのを押す
1. ローカルのファイルがweb IDEに表示されることを確認する
1. web IDEからのファイル変更がローカルにも反映されていることを確認する
