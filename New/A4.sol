// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Array{
    // There are two types of array:
    // Dynamic
    uint256[] public my_array;

    // Static
    uint256[3] public my_array2;

    function addToArray(uint256 num) public{
        my_array.push(num);
    }
}