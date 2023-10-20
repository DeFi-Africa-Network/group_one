// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaskMarketplace {
    address public client;
    address public tasker;
    uint256 public taskPrice;
    bool public taskCompleted;

    event TaskCompleted(address indexed client, address indexed tasker, uint256 price);

    constructor(address _client, address _tasker, uint256 _price) {
        client = _client;
        tasker = _tasker;
        taskPrice = _price;
        taskCompleted = false;
    }

    modifier onlyClient() {
        require(msg.sender == client, "Only the client can call this function");
        _;
    }

    modifier onlyTasker() {
        require(msg.sender == tasker, "Only the tasker can call this function");
        _;
    }

    function completeTask() public onlyTasker {
        require(!taskCompleted, "Task is already completed");
        taskCompleted = true;
        emit TaskCompleted(client, tasker, taskPrice);
    }

    function withdrawPayment() public onlyClient {
        require(taskCompleted, "Task is not completed yet");
        payable(tasker).transfer(taskPrice);
    }
}
