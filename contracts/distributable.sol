// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/AccessControl.sol";
import "./erc_interface.sol";

contract Distributable is AccessControl {
    bytes32 public constant DISTRIBUTER = keccak256("DISTRIBUTER");
    
    constructor () {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }
    
    function grant(address _distributer) public {
        grantRole(DISTRIBUTER, _distributer);
    }
    
    modifier onlyDistributer() {
        require(hasRole(DISTRIBUTER, msg.sender), "Distributable: msg.sender is not Distributer");
        _;
    }
}