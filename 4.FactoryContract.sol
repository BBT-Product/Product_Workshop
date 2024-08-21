// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./2.MyToken.sol"; // Import the token contract

contract TokenFactory {
    address[] private deployedTokens;

    function createToken(
        string memory _name,
        string memory _symbol,
        uint8 _decimal
    ) public {
        MyToken newToken = new MyToken(_name, _symbol, _decimal);
        deployedTokens.push(address(newToken));
    }

    function getDeployedTokens() public view returns (address[] memory) {
        return deployedTokens;
    }
}
