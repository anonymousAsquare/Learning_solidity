// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Str{
    // When receiving a string in a function it is slightly different from an in, the "memory" key word has to be added
    string public my_str;
    function addToStr(string memory _str) public{
        my_str = _str;
    }
}