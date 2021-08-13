var Web3 = require('web3');
var web3 = new Web3('http://localhost:8545');
// web3.setProvider(new web3.providers.HttpProvider());
// var _account = web3.eth.accounts.create();
// console.log(web3.eth.accounts);
// web3.eth.getAccounts().then(console.log);
web3.eth.personal.newAccount('test').then(console.log);