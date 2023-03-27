// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC20/extensions/draft-IERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/interfaces/IERC1820Registry.sol";

interface TokenRecipient {
    function tokensReceived(address sender, uint amount) external returns (bool);
}

contract Bank is TokenRecipient{
    mapping(address => uint) public deposited;

    address public immutable token;

    constructor(address _token) {
        token = _token;
    }

    // 收款时被回调
    function tokensReceived(address sender, uint amount) external returns (bool) {
        require(msg.sender == token, "invalid");
        // sender 是 MyERC20Callback 传过来的 EOA 账户地址
        deposited[sender] += amount;
        return true;
    }


}
