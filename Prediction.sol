pragma solidity ^0.8.7;
// SPDX-License-Identifier: MIT

contract PREDICTION {

   address public owner;
   address payable private feeTreasury;
   uint256 public total_value;
   uint256 public cost = 1 ether;
   uint256 public jackpot = 5 ether;
   uint256 public fee = 1 ether;
   uint256 public reward = 1 ether;
   uint256 private roller;
   uint256 public updated;
   string public win;
   
   mapping (uint => uint) public lastupdate;
   
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
       owner = newOwner;
   }
   
   function UpdateJackpot() public {
       require(blocktimestamp >= (lastupdate[updated] + 28 days));
       require(payable(msg.sender).send(reward);
       jackpot = jackpot + 5 ether;
       fee = fee + 1 ether;
       total_value -= reward;
       updated++;
       lastupdate[updated] = blocktimestamp;
   }
   
   
