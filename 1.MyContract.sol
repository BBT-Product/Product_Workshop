// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract MyContract {
    address public owner;
    string private name;
    uint256 public balance;

    constructor(string memory _name) {
        owner = msg.sender;
        name = _name;
    }

    function sum(uint256 _a, uint256 _b) public pure returns (uint256) {
        return (_a + _b);
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function setName(string memory _name) public {
        name = _name;
    }

    function deposit() public payable {
        require(msg.value > 0, "Must send some Ether");
        balance += msg.value;
    }

    function withdraw(uint256 _amount) public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(_amount <= balance, "Insufficient balance");

        balance -= _amount;
        payable(owner).transfer(_amount);
    }
}
