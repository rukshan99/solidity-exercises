pragma solidity >=0.7.0 <0.9.0;

// A simple smart contract for a crypto token
// Only the creator can mint new coins/tokens
// Anyone can transfer coins with an Etherium key-pair
contract coin {
    address public minter;
    mapping(address => uint256) public balances;
    event sent(address from, address to, uint256 amount);

    constructor() {
        minter = msg.sender;
    }

    modifier onlyOwner() {
        require(minter == msg.sender);
        _;
    }

    error insufficientBalance(uint256 requested, uint256 available);

    function mint(address payable receiver, uint256 amount) public onlyOwner {
        balances[receiver] += amount;
    }

    function send(address payable receiver, uint256 amount) public {
        if (amount > balances[msg.sender]) {
            revert insufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });
        }

        balances[msg.sender] -= amount;
        balances[receiver] += amount;

        emit sent(msg.sender, receiver, amount);
    }
}
