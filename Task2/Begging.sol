// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BeggingContract {
    // 合约所有者
    address public owner;

    // 记录每个捐赠者的捐赠金额
    mapping(address => uint256) public donations;

    // 事件
    event Donated(address indexed donor, uint256 amount);
    event Withdrawn(address indexed owner, uint256 amount);

    // 修饰符：仅限所有者调用
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // 捐赠函数：用户捐款时附带 ETH
    function donate() public payable {
        require(msg.value > 0, "Donation must be > 0");
        donations[msg.sender] += msg.value;

        emit Donated(msg.sender, msg.value);
    }

    // 查询捐赠金额
    function getDonation(address donor) public view returns (uint256) {
        return donations[donor];
    }

    // 提现函数：仅限所有者，提取合约余额
    function withdraw() public payable onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");

        payable(owner).transfer(balance);

        emit Withdrawn(owner, balance);
    }

    // 查询合约余额
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
