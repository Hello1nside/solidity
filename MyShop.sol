// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract MyShop {
    address public owner;
    mapping (address => uint) public payments;

    // assign contract owner address
    construct() {
        owner = msg.sender;
    }

    // add payment info (sender=>summ) to the map
    function payForItem() public payable {
        payments[msg.sender] = msg.value;
    }

    // withdraw money
    function withdrawAll() public {
        address payable _to = payable (owner);
        address _thisContract = address(this);
        _to.transfer(_thisContract.balance);
    }
}
