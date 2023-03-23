require("@nomicfoundation/hardhat-toolbox");
require("hardhat-abi-exporter");
require("@nomiclabs/hardhat-etherscan");

let dotenv = require('dotenv');
dotenv.config({ path: "./.env" });

const devmnemonic = process.env.DEVMNEMONIC;
const mumbai_private = process.env.MUMBAI_PRIVATE_KEY;
const goerli_private = process.env.GOERLI_PRIVATE_KEY;
const scankey = process.env.ETHERSCAN_API_KEY;


/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  networks: {
    hardhat: {
      chainId: 31337,
      gas: 12000000,
      accounts: {
        mnemonic: devmnemonic,
      }
    },
    
    // mumbai: {
    //   url: "https://endpoints.omniatech.io/v1/matic/mumbai/public",
    //   accounts: {
    //     mnemonic: mnemonic,
    //   },
    //   chainId: 80001,
    // },

    mumbai: {
      url: "https://endpoints.omniatech.io/v1/matic/mumbai/public",
      accounts: [mumbai_private],
      chainId: 80001,
    },

    goerli: {
      url: "https://eth-goerli.api.onfinality.io/public",
      accounts: [goerli_private],
      chainId: 5
    },

  },
  
  etherscan: {
    apiKey: scankey,
  },
};
