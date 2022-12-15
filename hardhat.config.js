/** @type import('hardhat/config').HardhatUserConfig */
require("@nomiclabs/hardhat-waffle");
require("dotenv").config()

module.exports = {
  networks: {
    goerli: {
      url: `https://`,
      accounts: [process.env.SIGNER_PRIVATE_KEY],
    }
  },
  solidity: "0.8.17",
};
