// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {priceConverter} from "./A4_price_converter_library.sol";

//  Adavanced solidity making our code more gas efficeint

// To make the contract more effecient we have to declear custom error types rather than using a string
//  error is a keyword used for declaring custom error types
error MustBeOwner(); 
error SendingFailed();
error EthNotEnough();

contract FundMeA11{
    using priceConverter for uint256; // 'using' directive is used to bring its functionality into the scope of a data type

    uint256 public constant MIN_USD = 5 * 1e18; // 'constant' is a keyword that indicates that the value of MIN_USD cannot be changed after it is assigned. 
    // using the 'constant' keyword for variables that would not be changed later on makes our contract mare gas efficeint
    address[] public sender_Adresses;
    mapping(address => uint256) public address_to_amount;
    address public immutable i_owner; // 'immutable' is a keyword indicating that the variable can only be assigned once (typically during contract deployment) and its value cannot be changed afterwards.

    /* a constructor is a special function that is automatically 
    executed only once when a contract is deployed. It is used to initialize the state variables 
    of the contract or to perform any one-time setup tasks. */
    constructor(){
        i_owner = msg.sender;
    }

    function fund() public payable{
        // require(getConvertion(msg.value) > min_USD, "ETH not enough");
        // require(msg.value.getConvertion() > MIN_USD, "ETH not enough");
        if (msg.value.getConvertion() < MIN_USD){
            revert EthNotEnough();
        }
        sender_Adresses.push(msg.sender);
        address_to_amount[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner{
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
        // require(call_succcess, "Sending failed");
        if (call_succcess == false){
            revert SendingFailed();
        }
    }

    /* modifier is a piece of code that can be used to encapsulate reusable logic that can be 
    applied to multiple functions within a contract. Modifiers are typically used to enforce 
    access control, validate inputs, or perform other checks before executing a function. */
    modifier onlyOwner(){
        // require(i_owner == msg.sender, "Must be owner");
        if (i_owner != msg.sender){
            revert MustBeOwner(); // to declare custom errors, you would use the 'revert' keyword within a function. 
            // declaring custom errors makes the contract more gas efficient than using require and a string
        }
        _;
    }

    /* receive function in Solidity is a special type of function that is automatically called when the contract 
    receives Ether without any data or when it's called with a plain Ether transfer. Cannot return anything
    and must have 'external' visibility and 'payable' state mutablilty*/
    receive() external payable{
        fund();
    }
    
    /* fallback function is a special type of function that is invoked when a contract receives Ether without a matching 
    function signature or when a transaction fails its execution due to insufficient gas or other reasons. 
    for it to receive ETH it must be marked payable*/
    fallback() external payable{
        fund();
    } 
}