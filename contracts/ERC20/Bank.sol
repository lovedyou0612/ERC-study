// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// 1 将 token 合约注册给 Vault 合约 ( 构造函数内执行)
// 2 在 token 合约内为 Vault 合约授权(允许 Vault合约 使用授权的 token) approve 方法
// 3 在 Vault 合约内调用存款方法 deposite 用户存款
// 4 在 Vault 合约内调用取款方法 withdraw 用户取款
contract Bank {

    mapping(address => uint256) public _balance;
    address public immutable token;

    constructor (address _token) {
        token = _token;     // 注册 token 合约
    }

    // 用户存款方法
    function deposite(address user, uint amount) public payable {
        // 使用 ERC20 合约的 transferFrom 向 合约转账
        require(IERC20(token).transferFrom(msg.sender, address(this), amount),"Transfer from error");
        // 记录 user 存储了 amount 的资金
        _balance[user] += amount;
    }

}