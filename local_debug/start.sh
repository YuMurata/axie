RPC_PORT=8545
RPC_API="web3,eth,net,personal"
RPC_ADDRESS="0.0.0.0"
SCRIPT_DIR=$(cd `dirname $0`;pwd)
DATA_DIR=$SCRIPT_DIR
LOG_PATH=$SCRIPT_DIR/geth.log

geth  --rpc --rpcport $RPC_PORT --rpcapi $RPC_API --rpccorsdomain "*" --rpcaddr $RPC_ADDRESS --datadir $DATA_DIR --nodiscover --networkid 10 console 2>> $LOG_PATH
