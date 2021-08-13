var MyERC20Token = artifacts.require("./MyERC20Token.sol");

module.exports = function (deployer) {
    let initialSupply = 50000e18;
    deployer.deploy(MyERC20Token);
};