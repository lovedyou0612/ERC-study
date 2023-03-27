// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/Address.sol";

interface TokenRecipient {
    function tokensReceived(address sender, uint amount) external returns (bool);
}

contract ERC20Callback is ERC20 {
    using Address for address;

    constructor() ERC20(unicode"luhongfu","luer") {
        _mint(msg.sender, 800 * 10 ** 18);
    }
    // 直接调用该方法为 Bank 合约存款,然后在 Bank 合约调用 deposited 方法直接查询 user 在合约内的存款 
    function transferWithCallback(address recipient, uint256 amount) external returns (bool) {
        // 转账, 相当于 transfer 方法, 用 EOA 账户 给 Bank 合约转账 amount 个币, 相当于 token 合约对 Bank 合约授权
        // 问题? 这一步调用一个方法,下面 tokensReceived 方法也调用了, gas 真的比 两步的少么?
        _transfer(msg.sender, recipient, amount);
        if (recipient.isContract()) {
            bool rv = TokenRecipient(recipient).tokensReceived(msg.sender, amount);
            require(rv, "No tokensReceived");
        }

        return true;
    }
}