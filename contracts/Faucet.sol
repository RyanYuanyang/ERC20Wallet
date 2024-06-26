// contracts/Faucet.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

interface ERC20CappedBurnableToken {
    function transfer(address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    event Transfer(address indexed from, address indexed to, uint256 value);
}

contract Faucet {
    address payable public owner;
    ERC20CappedBurnableToken public token;

    // for testing purposes, 10 token per request
    uint256 public withdrawalAmount = 10 * (10 ** 18);
    uint256 public lockTime = 1 minutes;

    event Withdrawal(address indexed to, uint256 indexed amount);
    event Deposit(address indexed from, uint256 indexed amount);

    mapping(address => uint256) public nextAccessTime;

    constructor(address tokenAddress) payable{
        token = ERC20CappedBurnableToken(tokenAddress);
        owner = payable(msg.sender);
    }

    function requestTokens() public {

        require(msg.sender != address(0), "Request must not originate from a zero account");
        require(token.balanceOf(address(this)) >= withdrawalAmount, "Insufficient balance in faucet for request");
        require(block.timestamp >= nextAccessTime[msg.sender], "Insufficient time has passed since last request");

        nextAccessTime[msg.sender] = block.timestamp + lockTime;
        token.transfer(msg.sender, withdrawalAmount);
    }
    
    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function getBalance() public view returns (uint256) {
        return token.balanceOf(address(this));
    }

    function setWithdrawAmount(uint256 amount) public onlyOwner {
        withdrawalAmount = amount * (10 ** 18);
    }

    function setLockTime (uint256 amount) public onlyOwner {
        lockTime = amount * 1 minutes;
    }

    function withdrawal () external onlyOwner {
        emit Withdrawal(msg.sender, token.balanceOf(address(this)));
        token.transfer(msg.sender, token.balanceOf(address(this)));
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can call this function");
        _;
    }
}