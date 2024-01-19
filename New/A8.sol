// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract MemoryTypes{
    // string public str;
    
    struct Names{
        string firstname;
        string lastname;
    }
    Names public names;
    // memory
    // 1. It is used for dynamic storage, such as creating and manipulating arrays, strings, or structs.
    // 2. memory is temporary and is cleared when the execution of the function ends.
    // 3. memory is a temporary place where data can be stored during the execution of a function
    function strg (string memory _firstname, string memory _lastname) public{
        Names memory _names = Names(_firstname,_lastname);
        names = _names;
    }

    // callback
    // 1. calldata is a special, read-only area where function arguments are stored during external function calls.
    // 2. Data in calldata is immutable, meaning you cannot modify it directly within the function
    // 3. Functions in Solidity that are not marked as pure or view receive their arguments from calldata.
    // 4. It is used to access the function parameters passed during external calls.
    // it can be used with other data types other than string
    function processData(uint256[] calldata values) external {
    // Access and process data from calldata
    // ...
    }


    // storage
    // 1. Storage is used for data that needs to be preserved across function calls and persisted on the Ethereum blockchain.
    uint256 public myNumber; // State variable stored in storage
    function setNumber(uint256 newValue) external {
        // Modify the state variable stored in storage
        myNumber = newValue;
    }
    function getNumber() external view returns (uint256) {
        // Access the state variable stored in storage
        return myNumber;
    }
}