pragma solidity ^0.8.14;

contract Business {
   address public businessOwner;
   error InsufficientInputAmount();

   constructor(){
      businessOwner=msg.sender;
   }

   modifier onlyOwner() {
      require(
         msg.sender == businessOwner,
         "Only Owner can call this."
      );
      _;
   }
   function sell(uint amount) public payable { 
      if (amount > msg.value / 2 ether)
            revert InsufficientInputAmount();
      businessOwner=msg.sender;
   }

   function transfer(address recipient) public payable onlyOwner{ 
      assert(recipient!=address(0x0000000000000000000000000000000000000000));
      businessOwner=msg.sender;
   }
}
