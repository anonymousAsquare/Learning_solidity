// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract MyContract{
    uint256 public my_int;

    function my_func(uint256 _my_int) public{
        my_int = _my_int;
    }

    // Note: When storing data it attracts gas costs
}