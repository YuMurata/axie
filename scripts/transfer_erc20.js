console.log("test");
const abi = require("erc-20-abi");
const Web3 = require('web3');
let web3 = new Web3(Web3.givenProvider || "ws://localhost:8545");
console.log({ "Web3": web3 });

let tokenAddress = "0x84F35B4dE5f32168248ACC1bD1b21f870dA0705A";
let fromAddress = "0x2349d51e84EF104467A7f9CbFBA2BC5798Ada3E7";
let toAddress = "0x2F54a26308cb284Fa8982E95E1E1ab0bb0d1eb6C";

var BN = web3.utils.BN;

// 数値は巨大な数値になっても扱えるように BigNumber に変換
let decimals = new BN(18);
let amount = new BN(100);

//  ABI とコントラクト（ERC20トークン）のアドレスから、コントラクトのインスタンスを取得
let token = new web3.eth.Contract(abi, tokenAddress);
// console.log(token.name)

// 送付する ERC20 トークンの量を計算
let value = amount;
console.log(value);

async function getBalance(address) {
  const x = await token.methods.balanceOf(address).call({ from: fromAddress });

  console.log(x);
}

getBalance(fromAddress);

// 引数にウォレットのアドレスと送付する ERC20 のトークン量を渡して、transfer 関数を呼ぶ
token.methods.transfer(toAddress, value)
  .send({ from: fromAddress })
  .then(function (result) {
    console.log(result);
  });

