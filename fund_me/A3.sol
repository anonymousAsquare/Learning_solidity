// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
contract FundMeA3{
    uint256 public min_USD = 5 * 1e18;
    address[] public sender_Adresses;
    mapping(address => uint256) public address_to_amount;

    function fund() public payable{
        require(getConvertion(msg.value) > min_USD, "ETH not enough");
        sender_Adresses.push(msg.sender);
        address_to_amount[msg.sender] = address_to_amount[msg.sender] + msg.value;
    }

    // function withdraw() public{}
    function getPrice() public view returns(uint256){
        AggregatorV3Interface price_feed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = price_feed.latestRoundData();
        return uint256(price * 1e18);
    }

    function getConvertion(uint256 ETH_amount) public view returns(uint256){
        uint256 ETH_price = getPrice();
        uint256 amount_in_USD = (ETH_amount * ETH_price) / 1e18;
        return amount_in_USD;
    }

}