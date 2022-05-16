# Pomelo Token (POM)

# To deploy to the local network

You first need to start the local test node. To do so, open the CLI and run the following command:

`npx hardhat node`

The list of addresses and private keys generated are test accounts and addresses created for us that we can use to deploy and test our smart contracts. Each account is also loaded with 10,000 fake Ether.

Next, run this deploy script on the CLI:

`npx hardhat run scripts/deploy.js --network localhost`

Once this is executed, the smart contract should be deployed to the local test network and you will be able to start interacting with it. (note that test account #1 was used to deploy this contract)

You should see a similar output in the CLI:

`PomToken deployed to: 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0`

This address is what we will use in the client application to interact with the smart contract. Store this address somewhere accessible! You will need to use it when connecting to it from the client application.

# To deploy to Ropsten test network

Send yourself some Ether using a faucet

Make sure that the Metamask account you are using is your own and not a shared one issued by Hardhat

Create an Alchemy account and create an app there.

Copy the API URL and paste it in your hardhat.config.js file

Copy the private key of your Metamask account and paste it in hardhat.config.js file

Run `npx hardhat run scripts/deploy.js --network ropsten`

You should see a similar output in the CLI:

`PomToken deployed to: 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0`

Once this is executed, the smart contract should be deployed to the Ropsten test network and you will be able to start interacting with it.

Run `npm start` to load the CRA app.

You can now mint, burn, freeze, get balance and check total supply using the UI. (You should interact with the app using the same Metamask account that was used to deploy the contract)
# pom-token
