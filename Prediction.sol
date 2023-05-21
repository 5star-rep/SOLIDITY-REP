pragma solidity ^0.8.7;
// SPDX-License-Identifier: MIT

contract PREDICTION {

   address public owner;
   address payable private feeTreasury;
   uint256 public total_value;
   uint256 public cost = 1 ether;
   uint256 public jackpot = 5 ether;
   uint256 public fee = 1 ether;
   uint256 private roller;
   string public win;
   
   constructor() payable {
       owner = msg.sender;
   }

   modifier isOwner() {
       require(msg.sender == owner, "Caller not owner");
       _;
   }
       
   receive() external payable {
       feetreasury.transfer(msg.value);
   }

   function ChangeOwner(address newOwner) public isOwner {
    
