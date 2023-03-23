const { ethers } = require("hardhat");
require('hardhat-abi-exporter');

async function main() {
  const MyTokenERC20 = await ethers.getContractFactory("MyTokenERC20");
  const myTokenERC20 = await MyTokenERC20.deploy();
  
  await myTokenERC20.deployed();
  console.log("MyTokenERC20 deployed to:", myTokenERC20.address);
}

main()
.then(() => process.exit(0))
.catch((error) => {
  console.error(error);
  process.exit(1);
});
