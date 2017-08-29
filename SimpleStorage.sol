pragma solidity ^0.4.5;
 
//SimpleStorage是合约名。
contract SimpleStorage {
    //uint 256位无符号整数
  uint storedData;
 
    //设值
  function set(uint x) {
    storedData = x;
  }
 
    //取值
  function get() constant returns (uint retVal) {
    return storedData;
  }
}
