# 実装草案

## 作成物

### インターフェース.html
* 送金操作をするファイル
* metamaskを使えるブラウザから開いて操作する
  * slp所有アカウントはroninで管理してるらしい
  * slp所有アカウントを参照するにはroninが使えるブラウザを使う必要がある、と思う
  * javascriptからslp所有アカウントを参照する方法を調べる必要がある

#### 構成
* 送金処理ボタン
  * 押したら各貸出アカウントから7:3で管理アカウントとスカラーアカウントにslpを分配する
* アカウント表
  * 項目は、設定変更ボタン、スカラーの名前、貸出アカウント、スカラーアカウント、送金済み（ox）
  * 設定変更ボタンを押せばスカラーの名前、貸出アカウント、スカラーアカウントを編集できる
  * 送金済み(ox)は送金処理が正しく終了したかを表す
    * 月初めに自動的にリセットされるとうれしい
  * 各項目はjsonで管理する
* スカラー追加ボタン
  * ボタンが押されたらダイアログを出す
  * ダイアログにスカラーの名前、貸出アカウント、スカラーアカウントを入力する
  * ダイアログ上の追加ボタンを押せばアカウント表に新たな行を追加する
* スカラー削除ボタン
  * ダイアログ上でスカラーアカウント、貸出アカウントを入力する
  * 対応するアカウント表の対応する行を削除する
* 分配率設定ボタン
  * 現在の管理者:スカラーのslp分配率をテキストボックスに表示する
  * テキストボックスに管理者:スカラーのslp分配率を入力してボタンを押せば分配率を再設定する
* slpコントラクト設定ボタン
  * 現在設定されているslpコントラクトのアドレスをテキストボックスに表示する
  * テキストボックスにslpコントラクトのアドレスを入力してボタンを押せばコントラクトアドレスを再設定する
  * 多分使わない

### 送金コントラクト.sol
* 送金処理をするコントラクトの定義ファイル
* remixからデプロイするつもり
  * gethとかもあるらしいけどremixでデプロイできなったら調べる

#### 構成
* 分配率設定処理
  * 管理アカウントのみ実行できる
* slpコントラクトのアドレス登録処理
  * 管理アカウントのみ実行できる
* 分配処理
  * 貸出アカウントのみ実行できる

## 想定する実行方法
1. 管理アカウントで`送金コントラクト.sol`をデプロイする
1. 送金日になったら`インターフェース.html`をmetamask、roninが使えるブラウザで開く
1. 送金処理ボタンを押す
1. アカウント表の各行の`送金済み`がすべてoになっていることを確認する
   * `送金済み`がxになっているアカウントは手動で残高などを確認し、必要があれば手動で送金する

## 処理内容
案-1でやりたいけどやり方わからないから案-2のやり方調べる

### 案-1
1. 送金処理ボタンを押す
1. web3でroninから貸出アカウントのリストを取得する
   * やり方わからぬ
1. 貸出アカウントのリストとアカウント表のスカラー名を対応付ける
1. 貸出アカウントリストをfor文で1つずつ取り出す
1. 取り出した貸出アカウントからコントラクトの`分配処理`を呼び出す
   * ここで詰まってる
   * 仕様上コントラクトが送金処理を呼び出すので
     * `erc.transfer`が使えない
       * コントラクトはtokenを持ってないから
     * `erc.transferFrom`を使うっぽい
       * 事前に貸出アカウントから`erc.approve`を呼ばないといけない
         * 多分web3上で呼ぶ？
         * web3から`erc.approve`呼べるなら`erc.transfer`も呼べるのでは？
           * コントラクトいらないのでは？
         * approveしてtransferFromってガス代かかりそう

### 案-2
1. 送金処理ボタンを押す
1. web3でroninから貸出アカウントのリストを取得する
   * やり方わからぬ
1. 貸出アカウントのリストとアカウント表のスカラー名を対応付ける
1. 貸出アカウントリストをfor文で1つずつ取り出す
1. web3で`erc.transfer`を呼ぶ
   * めんどそう