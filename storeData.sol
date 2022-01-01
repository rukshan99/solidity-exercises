// Defining solidity version to be used
pragma solidity >=0.7.0 <0.9.0;

// A simple smart-contract for recieving, storing and returning data
contract storeData {

    // states or variables
    uint private num;
    string private name;

    function setNum(uint x) public {
        num = x;
    }

    // view -> to specify that this function can not modify contract states
    // returns(uint) -> to specify return type
    function getNum() public view returns(uint) {
        return num;
    }

    function setName(string memory x) public {
        name = x;
    }

    function getName() public view returns(string memory) {
        return name;
    }
}
