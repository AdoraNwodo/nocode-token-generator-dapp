import * as dotenv from "dotenv";
import "@nomiclabs/hardhat-ethers";

dotenv.config();
const { API_URL, PRIVATE_KEY } = process.env;


/**
* @type import('hardhat/config').HardhatUserConfig
*/
module.exports = {
   solidity: "0.8.14",
   defaultNetwork: "rinkeby",
   networks: {
      hardhat: {},
      rinkeby: {
         url: API_URL,
         accounts: [`0x${PRIVATE_KEY}`]
      }
   },
}