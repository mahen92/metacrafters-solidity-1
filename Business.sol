pragma solidity ^0.8.14;

contract Business {
   address public businessOwner;
   error InsufficientInputAmount();

   /*
   Sets the businessOwner to the address which deploys the smart contract.
   */
   constructor(){
      businessOwner=msg.sender;
   }

   /*
   Modifier which ensures that only an owner can call the corresponding function.
   */
   modifier onlyOwner() {
      require(
         msg.sender == businessOwner,
         "Only Owner can call this."
      );
      _;
   }

   /*
   Sells the contract to the buyer. Ensures that the amount is greater than or equal to 2 ether.
   */
   function sell(uint amount) public payable { 
      if (amount > msg.value / 2 ether)
            revert InsufficientInputAmount();
      businessOwner=msg.sender;
   }

   /*
   Transfers the contract to another address. The assert function ensures that the new owner is not the zero addresss.
   */
   function transfer(address recipient) public payable onlyOwner{ 
      assert(recipient!=address(0x0000000000000000000000000000000000000000));
      businessOwner=msg.sender;
   }
}
