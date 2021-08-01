// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
import "./distributable.sol";
import "./erc_interface.sol";

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract Distribute is Ownable, Distributable {
    event CalcShareEvent(uint _managerShare, uint _schoalarShare);
    uint private managerRate;
    uint private schoalarRate;

    IERC20 private ercInterface;

    modifier onlySetShareRate() {
        require(managerRate != 0, "Distribute: manageRate is not set");
        require(schoalarRate != 0, "Distribute: schoalarRate is not set");
        _;
    }
    
    function setShareRate(uint _managerRate, uint _schoalarRate) public onlyOwner {
        managerRate = _managerRate;
        schoalarRate = _schoalarRate;
    }
    
    modifier onlySetInterface() {
        require(address(ercInterface) != address(0x0), "Distribute: ERC contract address is not set");
        _;
    }
    
    function setTokenAddress(address _tokenAddress) public onlyOwner {
        ercInterface = IERC20(_tokenAddress);
    }
    
    function distribute(address _schoalarWallet, address _managerWallet) public payable onlySetInterface onlyDistributer {
        (uint managerShare, uint schoalarShare) = calcShare(getBalanceOfToken(msg.sender));
        emit CalcShareEvent(managerShare, schoalarShare);
        ercInterface.approve(address(this), 1);
        ercInterface.transferFrom(msg.sender,_managerWallet, 1);
        
        // ercInterface.transfer(_managerWallet, managerShare);
        // ercInterface.transfer(_schoalarWallet, schoalarShare);
    }
    
    function calcShare(uint _balance) public view returns(uint, uint) {
        uint managerShare = _balance * managerRate / 100;
        uint schoalaraShare = _balance - managerShare;
        
        return (managerShare, schoalaraShare);
    }
    
    function getBalanceOfToken(address _address) public view onlySetInterface returns (uint) {
        return ercInterface.balanceOf(_address);
    }
    
    function testSetup() public onlyOwner {
        address myToken = address(0xd9145CCE52D386f254917e481eB44e9943F39138);
        setTokenAddress(myToken);
        
        address distributer = address(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
        grant(distributer);
        setShareRate(70,30);
    }
    
    function testDistribute() public payable onlySetInterface onlyDistributer {
        address managerWallet = address(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        address schoalarWallet = address(0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c);
        distribute(schoalarWallet, managerWallet);
    }
}