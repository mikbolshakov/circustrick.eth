import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "hardhat-deploy";
import "hardhat-deploy-ethers";
import * as dotenv from "dotenv";
dotenv.config();

const config: HardhatUserConfig = {
    solidity: {
        version: "0.8.17",
    },
    networks: {
        hardhat: {
            chainId: 31337
        }
    },
    namedAccounts: {
        deployer: 0,
    },
};

export default config;
