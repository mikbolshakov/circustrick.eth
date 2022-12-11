import { ethers } from "hardhat";
import "hardhat-deploy";
import "hardhat-deploy-ethers";

async function main() {
  const CircusTrick = await ethers.getContractFactory("CircusTrick");
  const circusTrick = await CircusTrick.deploy();
  const [deployer] = await ethers.getSigners();
  
  await circusTrick.deployed();

  console.log(`CircusTrick deployed to ${circusTrick.address} with the account: ${await deployer.getAddress()}`);
  console.log("Account balance:", (await deployer.getBalance()).toString());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

/* 
networks: {
        goerli: {
            url: process.env.GOERLI,
            accounts: [<string>process.env.GOERLI_PRIVKEY],
        },
    },
    */