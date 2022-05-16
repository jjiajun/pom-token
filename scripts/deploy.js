const hre = require("hardhat");

async function main() {

  const PomToken = await hre.ethers.getContractFactory("PomToken");
  const pomToken = await PomToken.deploy("1000000000000000000000");

  await pomToken.deployed();

  console.log("PomToken deployed to:", pomToken.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
