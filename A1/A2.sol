// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract DataTypes{
    uint256 answer;
    function addVal(uint256 a, uint256 b) public{
        answer = a + b;
    }

    function ans() public view returns(uint256){
        return answer;
    }
}
