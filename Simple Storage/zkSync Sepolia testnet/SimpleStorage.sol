// SPDX-License-Identifier: MIT
pragma solidity 0.8.24; // stating our version of solidity

contract SimpleStorage {
    // unint256 get initialised as 0 if no number is assigned
    // internal var by default
    // contract vars declared outside of a function are storage vars by default
    uint256 myFavoriteNumber;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // initialise empty dynamic array of people
    Person[] public listOfPeople;

    // function
    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    // view functions disallow modification of state
    // pure functions disallow changing or reading from state
    // returns specifies the data type returned by the function
    // calling a view function incurs no cost, unless it is called internally by a contract
    function retrieve() public view returns(uint256) {
        return myFavoriteNumber;
    }

    // calldata - temp vars that cannot be modified
    // memory - temp vars that can be modified
    // storage - permanent vars that can be modified
    // data location can only be specified for array,struct or mapping types, not primative types
    // storage cannot be declared in function args because they are temporary by nature
    function addPerson (string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
    }
}