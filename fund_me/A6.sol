// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {priceConverter} from "./A4_price_converter_library.sol";

contract FundMeA6{
    using priceConverter for uint256; // 'using' directive is used to bring its functionality into the scope of a data type

    uint256 public min_USD = 5 * 1e18;
    address[] public sender_Adresses;
    mapping(address => uint256) public address_to_amount;

    function fund() public payable{
        // require(getConvertion(msg.value) > min_USD, "ETH not enough");
        require(msg.value.getConvertion() > min_USD, "ETH not enough");
        sender_Adresses.push(msg.sender);
        address_to_amount[msg.sender] += msg.value;
    }

    function withdraw() public{
        
        for(uint256 sender_index = 0; sender_index < sender_Adresses.length; sender_index++){
            address sender = sender_Adresses[sender_index];
            address_to_amount[sender] = 0;
        }

        sender_Adresses = new address[](0); // resetting the array of sender address to an empty array
        // alternatively
        //sender_Adresses = [];

        // withdrawing the funds 
        /*
        // there are 3 ways to withdraw funds from a contract
        // 1. transfer(if more than 2300 gas is used it throws an error and revert the transaction)
        payable(msg.sender).transfer(address(this).balance);

        // 2. send(if it fails, it returns a bool, it will only revert the transaction if the 'require' keyword is used)
        bool sent = payable(msg.sender).send(address(this).balance);
        require(sent, "Sending failed");

        // 3. call(if it fails it returns 2 variables(bool callSuccess and bytes datareturned(arrayr))
        (bool call_succcess,) = payable(msg.sender).call{value: address(this).balance}(""); // call, calls a function but since we arent calling any function, we just input an empty string
        require(call_succcess, "Sending failed");
        */
        // using call is the recommeded way
        (bool call_succcess,) = payable(msg.sender).call{value: address(this).balance}(""); // call, calls a function but since we arent calling any function, we just input an empty string
        require(call_succcess, "Sending failed");
    }
}