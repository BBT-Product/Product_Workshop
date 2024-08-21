// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IMyContract {
    function setName(string memory _name) external;

    function getName() external view returns (string memory);
}

contract ProxyContract {
    IMyContract public myContract;

    constructor(IMyContract _myContract) {
        myContract = _myContract;
    }

    function setName(string memory _name) public {
        myContract.setName(_name);
    }

    function getName() public view returns (string memory) {
        return (myContract.getName());
    }
}
