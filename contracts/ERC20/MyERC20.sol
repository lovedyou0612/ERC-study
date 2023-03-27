// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


// 实现 ERC20 协议 在 mumbai 测试网发 800 个代币
contract MyERC20 is ERC20 {
    constructor() ERC20(unicode"下一个暴富者","luer") {
        _mint(msg.sender, 800 * 10 ** 18);
    }
}