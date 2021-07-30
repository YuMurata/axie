# bash用スクリプト
# 実行: `bash ./remixd_sync/sync.sh`

PWD=`pwd`
echo "project dir: $PWD"
remixd -s $PWD --remix-ide https://remix.ethereum.org