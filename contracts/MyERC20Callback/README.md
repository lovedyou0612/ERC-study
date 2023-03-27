# 基于 ERC20 协议 模仿 ERC777 协议实现一个带回调的(跳过授权步骤,一步操作完)

```shell
ERC777 协议相比 ERC20 协议的优点:
    1 send(dest,value,data)
    1.1 查询地址是否注册方法了
    2 即便是普通地址也可以实现回调(如何实现的?)
    3 防止误入合约被锁死
    4 ERC777 通过全局注册表(ERC1820)的注册监听回调
        4.1 专门记录那个地址注册了那个合约的方法, 当某个地址。。。。。
        4.2 send()方法
    5 操作步骤
        5.1 MyERC20Callback 合约内 transferWithCallback 方法实现 TokenRecipient 接口内的 tokensReceived 方法。调用 transferWithCallback 方法后用 _transfer 方法进行授权，最后在 Bank合约内回调 tokensReceived 方法为用户存款.
```
