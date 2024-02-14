// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
// In Solidity, a library is a special type of contract that allows you to deploy reusable code that can be called by other contracts
// All functions in the library must be internal
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library priceConverter{
    function getPrice() internal view returns(uint256){
        AggregatorV3Interface price_feed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = price_feed.latestRoundData();
        return uint256(price * 1e18);
    }

    function getConvertion(uint256 ETH_amount) internal view returns(uint256){
        uint256 ETH_price = getPrice();
        uint256 amount_in_USD = (ETH_amount * ETH_price) / 1e18;
        return amount_in_USD;
    }
}