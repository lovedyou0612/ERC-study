# 实现对合约账户进行转账逻辑

```shell
1 user 调用 MyERC20 内 approve(Bank,1000) 为 Bank 授权 1000 的币( ERC20 协议内 allowance 记录 Bank 可以用 1000 的币)
2 user 再次调用 Bank 合约的存款方法进行存款
3 具体逻辑:
    3.1 user 部署 MyERC20 合约
    3.2 user 部署 Bank 合约(MyERC20 合约地址传进去)
    3.4 user 调用 MyERC20 合约的 approve 为 Bank 合约授权一定数量的 token
    3.5 user 调用 Bank 合约内 deposite 方法内的 transferFrom 向 Bank 转账，并记录谁向 Bank 转账的数量.
```
