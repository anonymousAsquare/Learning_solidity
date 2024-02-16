// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ReceiveNFallback{
    uint256 public result;

    /* receive function in Solidity is a special type of function that is automatically called when the contract 
    receives Ether without any data or when it's called with a plain Ether transfer. Cannot return anything
    and must have 'external' visibility and 'payable' state mutablilty.*/
    receive() external payable{
        result = 1;
    }

    /* fallback function is a special type of function that is invoked when a contract receives Ether without a matching 
    function signature or when a transaction fails its execution due to insufficient gas or other reasons. 
    for it to receive ETH it must be marked payable*/
    fallback() external payable{
        result = 2;
    }
}