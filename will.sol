pragma solidity >=0.7.0 <0.9.0;

contract will {

    address owner;
    uint fortune;
    bool deceased;

    constructor() payable {
        owner = msg.sender; // Sender address
        fortune = msg.value; // The amount of ETH
        deceased = false;
    }

    // Modifier: only person who can call the contract is the owner
    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    // Modifier: the fortune can be only sent to others, when the owner is deceased
    modifier mustBeDeceased {
        require(deceased == true);
        _;
    }

    // Array of family wallet addresses
    address payable[] familyWallets;

    // Mapping of family wallet addresses and relevant amount of inheritance from the fortune
    mapping(address => uint) inheritance;

}