pragma solidity ^0.8.7;
// SPDX-License-Identifier: MIT

contract PREDICTION {

   address public owner;
   address payable private feetreasury;
   address public lastupdater;

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
       uint256 charity = msg.value;
       feetreasury.transfer(charity);
   }

   function ChangeOwner(address newOwner) public isOwner {
       owner = newOwner;
   }
   
   function ChangeTreasury(address payable newTreasury) public isOwner {
       feetreasury = newTreasury;
   }
   
   function UpdateJackpot() public {
       require(lastupdate >= 100);
       require(payable(msg.sender).send(reward));
       jackpot = jackpot + 5 ether;
       fee = fee + 1 ether;
       total_value -= reward;
       lastupdate = 1;
       updated++;
       lastupdater = msg.sender;
   }
   
   function Predict(string memory letter) public payable {
       require(msg.value >= cost, "Wrong value");
       lastupdate++;
       total_value += msg.value;
       
       if (roller == 1) {
           winning = C;
       } else if (roller == 2) {
                  winning = O;
       } else if (roller == 3) {
                  winning = R;
       } else if (roller == 4) {
                  winning = E;
       }
       
       if (roller == 5) {
           roller = 1;
       } else {
               roller++;
       }
       
       if (letter == winning) {
           require(payable(msg.sender).send(jackpot));
           feetreasury.send(fee);
           total_value -= jackpot;
           total_value -= fee;
       }
}
