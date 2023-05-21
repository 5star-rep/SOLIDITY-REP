pragma solidity ^0.8.7;
// SPDX-Identify-License: MIT

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
