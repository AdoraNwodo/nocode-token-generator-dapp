// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
import { ethers } from "hardhat";

async function main() {
  const ERC1155Factory = await ethers.getContractFactory("ERC1155Factory");
  const erc1155Factory = await ERC1155Factory.deploy();

  await erc1155Factory.deployed();

  console.log("ERC1155Factory deployed to:", erc1155Factory.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});