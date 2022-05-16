# Pomelo Token (POM)

Pom Token is a simple ERC20 token with mint, burn and freeze functionalities.

# Installation

1. Clone this repository
2. Navigate to this folder via your terminal and run ```npm i``` to install the NPM packages
3. Once installed, run `npm start` to load the Create React App (CRA).

#  How it works

1. The token contract has already been deployed and verified on Ropsten Etherscan
2. Upon loading the app, you will see a simple UI with the following buttons to interact with the token contract:

### Get Balance
- Fetches the balance of POM tokens that you own

### Check Total Supply
- Fetches the total supply of POM tokens in the economy

### Mint 3 Tokens
- Mints 3 POM tokens that are added to your Metamask wallet address. 3 POM tokens will be added to the total supply of POM too.
- Only the owner of the contract can do this for now.

<div align="center">
  <img src="https://user-images.githubusercontent.com/90031266/168688327-c2692c89-0216-4ad8-be9a-8c718dde0f03.gif" />
</div>

### Burn 1 Token
- Burns (permanently destroy) 1 POM token under your wallet address. 1 POM token will be deducted from the total supply of POM too.
- Only the owner of the contract can do this for now.

<div align="center">
  <img src="https://user-images.githubusercontent.com/90031266/168697396-1a8b6c67-2893-4e8a-8bf9-aa350237e3a1.gif" />
</div>

### Freeze
- Prevents any token holder from making any transaction with the token contract.
- Only the owner of the contract can do this for now.

<div align="center">
  <img src="https://user-images.githubusercontent.com/90031266/168697405-4f79a1eb-a348-437f-9ed1-30d0196abdf5.gif" />
</div>

### Unfreeze account
- Enable token holders to transact with the token contract.
- Only the owner of the contract can do this for now.

<div align="center">
  <img src="https://user-images.githubusercontent.com/90031266/168697510-2d890157-937f-4cc6-af4e-af58321c1a22.gif" />
</div>

# Requirements checked
- [x] Create a token that has mint, burn & freeze functionality
- [x] Only owner of contract should be able to mint, burn & freeze
- [x] Verify contract on Etherscan
- [x] Interact with the contract to show the various interaction flow



