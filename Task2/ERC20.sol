// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title A simple ERC20 Token Example
/// @notice Minimal ERC20 implementation for learning
contract MyToken {
    // 基本信息
    string public name = "ChetToken";
    string public symbol = "WLK";
    // uint8 public decimals = 18;
    uint256 public totalSupply;

    // 账户余额
    mapping(address => uint256) private balances;

    // 授权额度 owner => (spender => amount)
    mapping(address => mapping(address => uint256)) private allowances;

    // 合约拥有者
    address public owner;

    // 事件（标准 ERC20）
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // 构造函数：部署者为 owner
    constructor() {
        owner = msg.sender;
    }

    // 查询余额
    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }

    // 转账
    function transfer(address to, uint256 amount) public returns (bool) {
        require(to != address(0), "ERC20: transfer to zero");
        require(balances[msg.sender] >= amount, "ERC20: insufficient balance");

        balances[msg.sender] -= amount;
        balances[to] += amount;

        emit Transfer(msg.sender, to, amount);
        return true;
    }

    // 授权
    function approve(address spender, uint256 amount) public returns (bool) {
        require(spender != address(0), "ERC20: approve to zero");

        allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    // 查看授权额度
    function allowance(address _owner, address spender) public view returns (uint256) {
        return allowances[_owner][spender];
    }

    // 授权转账
    function transferFrom(address from, address to, uint256 amount) public returns (bool) {
        require(to != address(0), "ERC20: transfer to zero");
        require(balances[from] >= amount, "ERC20: insufficient balance");
        require(allowances[from][msg.sender] >= amount, "ERC20: allowance exceeded");

        balances[from] -= amount;
        balances[to] += amount;
        allowances[from][msg.sender] -= amount;

        emit Transfer(from, to, amount);
        return true;
    }

    // 增发代币（仅限 owner）
    function mint(address to, uint256 amount) public {
        require(msg.sender == owner, "Only owner can mint");
        require(to != address(0), "ERC20: mint to zero");

        uint256 mintAmount = amount;
        totalSupply += mintAmount;
        balances[to] += mintAmount;

        emit Transfer(address(0), to, mintAmount);
    }
}
