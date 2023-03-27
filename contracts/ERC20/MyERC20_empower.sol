// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// 实现 ERC20 协议 在 mumbai 测试网发 800 个代币
contract MyERC20_empower is ERC20 {

    // 实现 ERC20 代币协议, 发行 100000 token
    constructor() ERC20(unicode"luhongfu","luer") {
        _mint(msg.sender, 100000 * 10 ** 18);
    }

    // 授权 Bank 合约(利用 ERC20 内 approve 方法)

}