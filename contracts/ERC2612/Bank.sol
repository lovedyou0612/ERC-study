// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC20/extensions/draft-IERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/interfaces/IERC1820Registry.sol";

contract Bank{
    mapping(address => uint) public deposited;

    address public immutable token;

    constructor(address _token) {
        token = _token;
    }

    function deposit(address user, uint amount) public {
        require(IERC20(token).transferFrom(msg.sender, address(this), amount), "Transfer from error");
        deposited[user] += amount;
    }
    // 先线下获取签名信息,传入 permitDeposit 
    function permitDeposit(address user, uint amount, uint deadline, uint8 v, bytes32 r, bytes32 s) external {
        // permit 内 根据签名信息 调用_approve 进行授权
        IERC20Permit(token).permit(msg.sender, address(this), amount, deadline, v, r, s);
        // 调用 deposit 方法进行转账
        deposit(user, amount);
    }


}
