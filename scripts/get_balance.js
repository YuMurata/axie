(async () => {
console.log("get_balance")
var Web3 = require('web3');
// var web3 = new Web3('http://localhost:8545');
var _balance = web3.eth.getBalance(web3.eth.accounts[0]).then(console.log);
// console.log(_balance)
})()