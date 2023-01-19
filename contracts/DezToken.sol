//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "hardhat/console.sol";

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleVault is IERC20 {

    mapping(address => mapping(address => uint256)) public accountBalances; // address -> tokenAddress -> balance
    uint256 public withdrawalFee = 2; // 0.2%
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Deposit token into contract, update accountBalances
    function depositTokens(uint256 amount, address tokenAddress) external payable {
        // increase accountBalance for the particular user's address for the particular token 
        accountBalances[msg.sender][tokenAddress] += amount;

        // deposit token into contract
        IERC20(tokenAddress).transferFrom(msg.sender, address(this), amount);

        // TODO: emit depositTokens event
    }

    // Withdraw tokens from contract, update accountBalances
    function withdrawTokens(uint256 amount, address tokenAddress) external payable {
        require(accountBalances[msg.sender][tokenAddress] >= amount, 'Insufficient funds');

        // calculate withdrawal fee and remaining amount
        uint256 fee = amount * withdrawalFee / 1000;
        uint remainingAmount = amount - fee;

        // transfer 0.2% withdrawal fee from contract
        require(IERC20(tokenAddress).transfer(owner, fee), "Transfer failed");

        // decrease accountBalance for the particular user's address for the particular token 
        accountBalances[msg.sender][tokenAddress] -= amount;

        // transfer remaining fee to user
        IERC20(tokenAddress).transfer(msg.sender, remainingAmount);

        // TODO: emit withdrawTokens event
    }

    function queryBalance(address userAddress, address tokenAddress) public view returns (uint256) {
        return accountBalances[userAddress][tokenAddress];
    }

}