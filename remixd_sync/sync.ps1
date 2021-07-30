# powershell用スクリプト
# 実行: `.\remixd_sync\sync.ps1`

$PWD = (Convert-Path .)
echo "project dir: $PWD"
remixd -s $PWD --remix-ide https://remix.ethereum.org