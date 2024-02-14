// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {priceConverter} from "./A4_price_converter_library.sol";

contract FundMeA5{
    using priceConverter for uint256; // 'using' directive is used to bring its functionality into the scope of a data type

    uint256 public min_USD = 5 * 1e18;
    address[] public sender_Adresses;
    mapping(address => uint256) public address_to_amount;

    function fund() public payable{
        // require(getConvertion(msg.value) > min_USD, "ETH not enough");
        require(msg.value.getConvertion() > min_USD, "ETH not enough");
        sender_Adresses.push(msg.sender);
        address_to_amount[msg.sender] = address_to_amount[msg.sender] + msg.value;
    }
}