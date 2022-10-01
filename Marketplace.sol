pragma solidity ^0.5.0;

contract marketplace{
address public seller;
address public buyer;
mapping(address=>uint)public balance;

event listItem(address seller, uint price);
event purchasedItem(address seller, address buyer, uint price);

enum stateType{
    itemAvailable,
    itemPurchased
}
stateType public state;
constructor()public{
    seller = msg.sender;
    state = stateType.itemAvailable;
}
function buy(address seller, address buyer, uint price)public payable{
    require (price <= balance [buyer], "insufficient balance");
    state = stateType.itemPurchased;
    balance [buyer] -= price;
    balance [seller] += price;
    emit purchasedItem(seller, buyer, msg.value);
}
}
