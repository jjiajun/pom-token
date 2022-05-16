# Pomelo Token (POM)

Pom Token is a simple ERC20 token with mint, burn and freeze functionalities.

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#installation">Installation</a>
    </li>
    <li>
      <a href="#usage--features">Usage / Features</a>
    </li>
    <li>
      <a href="#built-with">Built With</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
    </li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>


# Installation

1. Clone this repository
2. Navigate to this folder via your terminal and run ```npm i``` to install the NPM packages
3. Once installed, run `npm start` to load the Create React App (CRA).
4. Go to Metamask, scroll down and click "Import Tokens"
5. Key in the token contract address ```0x13119b3c54f632ebe515e3cD409383cFeC1ef188```
6. You will now be able to see how many tokens you have (0)

#  How it works

1. The token contract has already been deployed and verified on Ropsten Etherscan
2. Upon loading the app, you will see a simple UI with the following buttons to interact with the token contract:

## Get Balance
- Fetches the balance of POM tokens that you own

## Check Total Supply
- Fetches the total supply of POM tokens in the economy

## Mint 3 Tokens
- Mints 3 POM tokens that are added to your Metamask wallet address. 3 POM tokens will be added to the total supply of POM too.

<div align="center">
  <img src="https://user-images.githubusercontent.com/90031266/168688327-c2692c89-0216-4ad8-be9a-8c718dde0f03.gif" />
</div>

## Burn 1 Token
- Burns (permanently destroy) 1 POM token under your wallet address. 1 POM token will be deducted from the total supply of POM too.

## Freeze
- Prevents any token holder from making any transaction with the token contract.

## Unfreeze account
- Enable token holders to transact with the token contract.

# Requirements
- Create a token that has mint, burn & freeze functionality
- Only owner of contract should be able to mint, burn & freeze
- Verify contract on Etherscan
- Interact with the contract to show the various interaction flow
