// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CircusTrick {
    address owner;
    uint bank;
    uint fixValue = 0.1 ether;
    uint minLockDelay = 60;
    uint maxLockDelay = 120;
    mapping(address => uint) balances;
    mapping(address => uint) timestamps;

    event Paid(address sender, uint timestamp);
    event Scammed(address sender);
    event Lucky(address sender);

    constructor() {
        owner = msg.sender;
    }

    function getPay() public payable {
        require(msg.value == fixValue, "only fix value");
        require(balances[msg.sender] == 0, "already payed");
        balances[msg.sender] = fixValue;
        timestamps[msg.sender] = block.timestamp;
        bank += fixValue;

        emit Paid(msg.sender, block.timestamp);
    }

    function withdrawMoney() public {
        require(balances[msg.sender] != 0, "nothing to withdraw :)");
        require(
            block.timestamp >= timestamps[msg.sender] + minLockDelay,
            "your time has not come yet"
        );
        if (
            bank < fixValue ||
            block.timestamp >= timestamps[msg.sender] + maxLockDelay
        ) {
            balances[msg.sender] = 0;

            emit Scammed(msg.sender);
        } else {
            address payable _to = payable(msg.sender);
            balances[msg.sender] = 0;
            bank -= fixValue;
            _to.transfer(fixValue);

            emit Lucky(msg.sender);
        }
    }

    function scam() public {
        require(msg.sender == owner, "you are not an owner");
        address payable _to = payable(msg.sender);
        bank = 0;
        _to.transfer(address(this).balance);
    }

    receive() external payable {}

    fallback() external payable {}
}
