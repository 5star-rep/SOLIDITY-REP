pragma solidity ^0.8.7;
// SPDX-License-Identifier: MIT

contract PREDICTION {

   address public owner;
   address payable private feetreasury;
   uint256 public total_value;
   uint256 public cost = 1 ether;
   uint256 public jackpot = 5 ether;
   uint256 public fee = 1 ether;
   uint256 public reward = 1 ether;
   uint256 private roller;
   uint256 public lastupdate;
   uint256 public updated;
   string public winning;
  
   
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
       require(lastupdate >= 100);
       require(payable(msg.sender).send(reward));
       jackpot = jackpot + 5 ether;
       fee = fee + 1 ether;
       total_value -= reward;
       lastupdate = 1;
       updated++;
       lastupdate[updated] = blocktimestamp;
   }
   
   function Predict(string memory letter) public payable {
       require(msg.value >= cost, "Wrong value");
       lastupdate++;
       total_value += msg.value;
       
       if (roller == 1) {
           winning = C;
       } else if (roller == 2) {
                  winning = O;
