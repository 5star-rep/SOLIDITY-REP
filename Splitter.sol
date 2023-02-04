// SPDX-License-Identifier: MIT
// File: Splitter.sol

pragma solidity ^0.8.7;


contract Splitter {

    address private owner;
    address payable [] private recipients;
    uint256 private Passcode;
    event TransferReceived(address _from, uint _amount);

    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    constructor(uint256 passcode) payable {
        owner = msg.sender;
        Passcode = passcode;
    }

    function SetRecipients(address payable [] memory _addrs, uint256 passcode) public isOwner {
        require(passcode == Passcode, "Wrong passcode");
        for(uint i=0; i < _addrs.length; i++) {
            recipients.push(_addrs[i]);
        }
    }

    function ChangeOwner(address newOwner, uint256 passcode) public isOwner {
        require(passcode == Passcode, "Wrong passcode");
        owner = newOwner;
    }

    receive() payable external {
        uint256 Share = msg.value / recipients.length;

        for(uint i=0; i < recipients.length; i++) {
            recipients[i].transfer(Share);
        }
        emit TransferReceived(msg.sender, msg.value);
    }
}
