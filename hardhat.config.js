require('dotenv').config();
require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-ethers");

const {API_URL, PRIVATE_KEY} = process.env;
/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.4",
  paths: {
    artifacts: './src/artifacts',
  },
  defaultNetwork: "ropsten",
  networks: {
    hardhat: {
      chainId: 1337
    },
    ropsten: {
      url: API_URL,
      accounts: [`0x${PRIVATE_KEY}`]
    }
  }
};
