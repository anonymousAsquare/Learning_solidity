// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {priceConverter} from "./A4_price_converter_library.sol";

contract FundMeA7{
    using priceConverter for uint256; // 'using' directive is used to bring its functionality into the scope of a data type

    uint256 public min_USD = 5 * 1e18;
    address[] public sender_Adresses;
    mapping(address => uint256) public address_to_amount;
    address public owner;

    /* a constructor is a special function that is automatically 
    executed only once when a contract is deployed. It is used to initialize the state variables 
    of the contract or to perform any one-time setup tasks. */
    constructor(){
        owner = msg.sender;
    }

    function fund() public payable{
        // require(getConvertion(msg.value) > min_USD, "ETH not enough");
        require(msg.value.getConvertion() > min_USD, "ETH not enough");
        sender_Adresses.push(msg.sender);
        address_to_amount[msg.sender] += msg.value;
    }

    function withdraw() public{
        require(owner == msg.sender, "Must be owner"); // for the withdraw function to only be called be the owner of the contract 
        for(uint256 sender_index = 0; sender_index < sender_Adresses.length; sender_index++){
            address sender = sender_Adresses[sender_index];
            address_to_amount[sender] = 0;
        }

        sender_Adresses = new address[](0); // resetting the array of sender address to an empty array
        // alternatively
        //sender_Adresses = [];

        // withdrawing the funds 
        // using call is the recommeded way
        (bool call_succcess,) = payable(msg.sender).call{value: address(this).balance}(""); // call, calls a function but since we arent calling any function, we just input an empty string
        require(call_succcess, "Sending failed");
    }
}