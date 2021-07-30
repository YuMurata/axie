@rem コマンドプロンプト用スクリプト
@rem 実行: `.\remixd_sync\sync.bat`

@echo off
setlocal
for /f "usebackq delims=" %%A in (`cd`) do set PWD=%%A
echo "project dir: %PWD%"
remixd -s %PWD% --remix-ide https://remix.ethereum.org