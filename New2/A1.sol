// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract SimpleStorage{
    // In solidity a custom type can be created just like uint256, bool, string, etc using the "struct" key word
    struct Person{
        string name;
        uint256 age;
    }

    mapping(string => uint256) public nameOfPerson;
    Person public People;

    function addPeople (string memory _name, uint256 _age) public virtual{
        People = Person({name: _name, age: _age});
        nameOfPerson[_name] = _age;
    }

    function getPeople() public view returns(string memory, uint256){
        return (People.name, People.age);
    }
}