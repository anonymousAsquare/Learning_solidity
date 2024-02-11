// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "./A1.sol";
contract StorageFactory2{
    SimpleStorage[] public listOfSimpleStorage;
    
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        listOfSimpleStorage.push(simpleStorage);
    }

    function sfStore(uint256 _index, string memory _name, uint256 _value) public {
        SimpleStorage mySimpleStorage = listOfSimpleStorage[_index];
        mySimpleStorage.addPeople(_name, _value);
    }

    function sfget(uint256 _index) public view returns(string memory, uint256){
        SimpleStorage mySimpleStorage = listOfSimpleStorage[_index];
        return mySimpleStorage.getPeople();
    }

}