// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract MyCont{
    uint256 my_num;

    function store(uint256 _num) public{
        my_num = _num;
    }

    // There two types of return function
    // view
    function retriev() public view returns(uint256){
        return my_num;
    }
    // pure
    function ret() public pure returns(uint256){
        return 6;
    }

    // Note: No gas fees are charged when retrieving data from a function unless the function is been
    // called in a gas cost functiom or transaction
}