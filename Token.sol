pragma solidity ^0.4.5;
 
contract Token {
    //代币发行者。address类型存储合约的地址或账户的地址。关键字“public”使变量能从合约外部访问。
  address public issuer;
    //mapping类型将一些address映射到无符号整数，理解为特殊的数组
  mapping (address => uint) balances;
 
    //事件让轻客户端能高效的对变化做出反应，监听传过来的参数值。
    //由issue函数的最后一行代码触发。
  event Issue(address account, uint amount);
    //由transfer函数的最后一行代码触发。
  event Transfer(address from, address to, uint amount);
 
    //构造函数，仅在合约创建时被运行。将合约创建者的地址存储在issuer中。
    //msg.sender总是存放着当前函数的外部调用者（可以是任何人）的地址。
  function Token() {
    issuer = msg.sender;
  }
 
    //发行一定数量的代币给某账户
  function issue(address account, uint amount) {
        //只有合约创建者才能执行issue。
    if (msg.sender != issuer) return;
 
    balances[account] += amount;
 
        Issue(account, amount);
  }
 
    //转移一定数量的代币给某账户
  function transfer(address to, uint amount) {
        //任何人都可以执行，但必须拥有amount数量的代币
    if (balances[msg.sender] < amount) return;
 
    balances[msg.sender] -= amount;
    balances[to] += amount;
 
    Transfer(msg.sender, to, amount);
  }
 
    //查询账户余额
  function getBalance(address account) constant returns (uint) {
    return balances[account];
  }
}
