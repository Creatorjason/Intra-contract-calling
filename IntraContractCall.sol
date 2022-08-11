//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
contract CallTestContract{
    function setX(TestContract _contract , uint _x) external{
        _contract.setX(_x);
    }
    function getX(TestContract _contract) external view returns(uint upperOut){
       upperOut = _contract.getX();
    }
    function setXandSendEther(TestContract _contract, uint _x) external payable{
        _contract.setXandReceiveEther{value : msg.value}(_x);
    }
    function getXandValue(TestContract _contract) external view returns(uint _x, uint _value){
        (_x, _value) = _contract.getXandValue(); 
    }
}


contract TestContract{
    uint public x;
    uint public value = 123;
    function setX(uint _x) external {
        x = _x;
    }
    function getX() external view returns(uint out){
        out = x;
    }
    function setXandReceiveEther(uint _x) external payable {
        x = _x;
        value = msg.value;
    } 
    function getXandValue() external view  returns(uint _x, uint _value){
        _x = x;
        _value = value;
    }
}
