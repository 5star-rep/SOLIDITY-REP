// SPDX-License-Identifier: MIT
// File: Bank.sol

pragma solidity ^0.8.7;


contract BANK {

    address private owner;
    uint total_value;
    uint256 withdrawAmnt;
    uint256 private Ownercode;
    uint256 private Passcode;

    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    constructor(uint256 ownercode) payable {
        owner = msg.sender;
        total_value = msg.value;
        Ownercode = ownercode;
    }

    receive() payable external {
        total_value += msg.value;
    }

    function ChangeOwner(address newOwner, uint256 ownercode) public isOwner {
        owner = newOwner;
        require(ownercode == Ownercode, "Wrong code");
    }

    function SetWithdrawAmnt(uint256 newAmnt, uint256 ownercode) public isOwner {
        withdrawAmnt = newAmnt;
        require(ownercode == Ownercode, "Wrong code");
    }

    function SetPasscode(uint256 newCode, uint256 ownercode) public isOwner {
        Passcode = newCode;
        require(ownercode == Ownercode, "Wrong code");
    }

    function Withdraw(address payable _addrs, uint256 passcode) public {
        require(passcode == Passcode, "wrong passcode");
        _addrs.transfer(withdrawAmnt);

        total_value -= withdrawAmnt;
    }

    function withdrawAll(uint256 ownercode) public isOwner {
        require(payable(msg.sender).send(address(this).balance));
        require(ownercode == Ownercode, "Wrong code");
    }
}
