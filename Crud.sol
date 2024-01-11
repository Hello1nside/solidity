// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Crud {
    struct User {
        uint id;
        string name;
    }

    User[] public users;

    uint public nextId = 1;

    function create(string memory name) public {
        users.push(User(nextId, name));
        nextId++;
    }

    function read(uint id) view public returns(uint, string memory) {
        uint pos = find(id);
        return(users[pos].id, users[pos].name);
    }

    function update(uint id, string memory name) public {
        uint pos = find(id);
        users[pos].name = name;
    }

    function destroy(uint id) public {
        uint pos = find(id);
        delete users[pos];
    }

    function find(uint id) view internal returns(uint) {
        for (uint i = 0; i < users.length; i++) {
            if (users[i].id == id) {
                return i;
            }
        }
        revert('User does not exist!');
    }
}
