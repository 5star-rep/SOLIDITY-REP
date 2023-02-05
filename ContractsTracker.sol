// SPDX-License-Identifier: MIT
// File: ContractsTracker.sol

pragma solidity ^0.8.7;


contract Tracker {

    address private owner;
    address [] public Contracts;
    uint256 private Passcode;

    modifier isOwner() {
        require(msg.sender == owner, "Caller not owner");
        _;
    }

    constructor(uint256 passcode) {
        owner = msg.sender;
        Passcode = passcode;

    function AddAddress(address track, uint256 passcode) public isOwner {
        require(passcode == Passcode, "Wrong passcode");
        Contracts.push(track);
    }
}
