//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "hardhat/console.sol";

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract SimpleVault {

    using SafeERC20 for IERC20;
    using Address for address;

    mapping(address => mapping(address => uint256)) public accountBalances; // address -> tokenAddress -> balance
    uint256 public withdrawalFee = 2; // 0.2%
    address public owner;

    // Declare events
    event Deposit(address indexed depositor, address indexed tokenAddress, uint256 amount);
    event Withdraw(address indexed withdrawer, address indexed tokenAddress, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    // Deposit token into contract, update accountBalances
    function depositTokens(uint256 amount, address tokenAddress) external payable {
        require(msg.value > 0 || msg.data.length > 0, "Deposit amount must be greater than 0");
        require(address(this) != tokenAddress, "This contract cannot deposit to itself");

        // deposit token into contract
        // important to transfer before updating balance to safeguard against re-entrancy attacks 
        // where the attacker calls the deposit function multiple times before actually transferring the amount, allowing them to "deposit" more tokens than they actually have.
        if (tokenAddress.isContract()) {
            // Deposit ERC20 tokens
            require(IERC20(tokenAddress).transferFrom(msg.sender, address(this), amount), "Transfer failed");
        } else {
            // Deposit ETH
            require(msg.value > 0, "Deposit amount must be greater than 0");
        }
        
        // increase accountBalance for the particular user's address for the particular token 
        accountBalances[msg.sender][tokenAddress] += amount;

        // emit depositTokens event
        emit Deposit(msg.sender, tokenAddress, amount);
    }

    // Withdraw tokens from contract, update accountBalances
    function withdrawTokens(uint256 amount, address tokenAddress) external payable {
        require(accountBalances[msg.sender][tokenAddress] >= amount, 'Insufficient funds');

        // calculate withdrawal fee and remaining amount
        uint256 fee = amount * withdrawalFee / 1000;
        uint remainingAmount = amount - fee;

        if (IERC20(tokenAddress).totalSupply() > 0) {
            
            // transfer 0.2% withdrawal fee from contract
            require(IERC20(tokenAddress).transfer(owner, fee), "Transfer failed");

            // decrease accountBalance for the particular user's address for the particular token 
            // important to decrease the account balance before transferring the remaining amount to the user to safeguard against re-entrancy attacks 
            // where the attacker calls the withdraw function multiple times before the balance is updated, allowing them to withdraw more tokens than they actually have.
            accountBalances[msg.sender][tokenAddress] -= amount;

            // transfer remaining amount to user
            require(IERC20(tokenAddress).transfer(msg.sender, remainingAmount), "Transfer failed");
        } else {
            require(fee <= msg.sender.balance, "Insufficient balance to pay withdrawal fee");
            address payable payableMsgSender = payable(msg.sender);
            payableMsgSender.transfer(remainingAmount);
            accountBalances[msg.sender][tokenAddress] -= amount;
        }

        // emit withdrawTokens event
        emit Withdraw(msg.sender, tokenAddress, amount);
    }

    function queryBalance(address userAddress, address tokenAddress) public view returns (uint256) {
        return accountBalances[userAddress][tokenAddress];
    }

}