// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FundMeA1{
    uint256 public val = 0;
    // To make a function accept ETH the payable keyword has to be used
    function fund() public payable{
        val += 1;
        require(msg.value > 1e18, "ETH not enough");
        // 'require' is a keyword used for validation checks. It ensures that certain conditions are met before proceeding with the execution of the smart contract. If the condition evaluates to false, the transaction will revert, meaning it will fail and any changes made by the transaction will be rolled back.
        // 'msg.value' is a global variable in Solidity that represents the amount of Ether (ETH) sent along with the transaction that triggered the execution of the smart contract. It is denoted in Wei, the smallest unit of Ether.
    }

    // function withdraw() public{}

}