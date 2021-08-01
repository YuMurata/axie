// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {

    string private _name = "TAKASE";
    string private _symbol = "TKS";

    address private account = msg.sender;

    constructor() ERC20(_name, _symbol) {
        uint value = 100000000000000000000;
        _mint(account, value);
    }
}