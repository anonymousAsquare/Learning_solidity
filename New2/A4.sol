// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./A1.sol";
// Inheritance 
contract AddFive is SimpleStorage{
    function addPeople(string memory _name, uint256 _age) public override{
        uint256 new_age = _age + 5;
        People = Person({name: _name, age: new_age });
        nameOfPerson[_name] = new_age;
    }
}