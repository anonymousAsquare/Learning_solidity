// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract CustomTypeMapping{
    // In solidity a custom type can be created just like uint256, bool, string, etc using the "struct" key word
    struct Person{
        string name;
        uint256 age;
    }

    // A variable of custom type can be created in two ways:
    //1.
    Person public person1 = Person("George", 19);
    //2.
    Person public person2 = Person({name: "George", age: 19});
    mapping(string => uint256) public nameOfPerson;

    // We can use array syntex to create an array of our custom type
    Person[] public listOfPeople1;
    Person[] public listOfPeople2;

    function addPeople (string memory _name, uint256 _age) public{
        // we can add elements to our custom type array in two ways:
        //1.
        Person memory newPerson = Person({name: _name, age: _age});
        listOfPeople1.push(newPerson);
        //2.
        listOfPeople2.push(Person(_name,_age));
        nameOfPerson[_name] = _age;
    }
}