// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyERC20Token is ERC20 {
    string private _name = "TAKASE";
    string private _symbol = "TKS";

    address private account = msg.sender;

    constructor() public {
        uint256 value = 100000000000000000000;
        _mint(account, value);
    }
}
