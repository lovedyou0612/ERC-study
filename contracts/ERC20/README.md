# 实现对合约账户进行转账逻辑

```shell
1 user 调用 MyERC20 合约的 approve(Bank,1000) 方法为 Bank 合约授权 1000 的币( ERC20 协议内 allowance 方法去记录 Bank 合 约可以用 1000 的币)
2 user 再次调用 Bank 合约的存款方法进行存款
3 具体逻辑:
    3.1 user 部署 MyERC20 合约
    3.2 user 部署 Bank 合约(MyERC20 合约地址传进去)
    3.4 user 调用 MyERC20 合约方法 approve 为 Bank 合约授权一定数量的 token
    3.5 user 调用 Bank 合约的 deposite 方法进行存款
```
