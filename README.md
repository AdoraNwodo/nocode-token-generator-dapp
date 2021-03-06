# AutoToken
[![Netlify Status](https://api.netlify.com/api/v1/badges/07395ef9-a2c4-40c6-9743-a9c7957d15f2/deploy-status)](https://app.netlify.com/sites/autotokendapp/deploys)
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/AdoraNwodo/nocode-token-generator-dapp/blob/master/LICENSE)
[![Issues](https://img.shields.io/github/issues/AdoraNwodo/nocode-token-generator-dapp.svg)](https://github.com/AdoraNwodo/nocode-token-generator-dapp/issues)
[![Forks](https://img.shields.io/github/forks/AdoraNwodo/nocode-token-generator-dapp.svg)](https://github.com/AdoraNwodo/nocode-token-generator-dapp/networks/members)
[![Stars](https://img.shields.io/github/stars/AdoraNwodo/nocode-token-generator-dapp.svg)](https://github.com/AdoraNwodo/nocode-token-generator-dapp/stargazers)
[![GitHub followers](https://img.shields.io/github/followers/AdoraNwodo.svg?style=social&label=Follow&maxAge=2592000)](https://github.com/AdoraNwodo?tab=followers)
[![Open Source Love svg1](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/AdoraNwodo/MedManager/)

AutoToken is a DApp that allows people without technical skills to create their own tokens without needing to write code ✨ 🚀

Try it out [here](https://autotokendapp.netlify.app/) 💕

[![AutoToken](https://raw.githubusercontent.com/AdoraNwodo/nocode-token-generator-dapp/main/ui/home.png)](https://github.com/AdoraNwodo/nocode-token-generator-dapp)

AutoToken is a no-code token generator that allows people from diverse backgrounds to create their tokens without needing to write any line of code. 

AutoToken aims to offer its users the ability to create ERC-20, ERC-721 and ERC 1155 tokens. In order to do that, the user needs to connect. Today, many people have to write ethereum smart contracts to do that. their MetaMask wallet. Once connected, users will have access to all the features that exist on the dApp.

With this solution, users will be able to specify the properties of the token they would like to create, deploy smart contracts that create virtual tokens without needing to write any line of code and see a list of all the tokens they have.

To read more about this solution, read the [whitepaper.](https://docs.google.com/document/d/1eEq2oF-_Vto4yFNgOWt58YgWzCOyji0R1u9k0msbZ8U/edit?usp=sharing) 💕💕

## Getting Started
This project uses Node dependencies. This means you would need to have `npm` or `yarn` installed. With this, you can get started with the following steps:
1. Clone this project git clone `git@github.com:AdoraNwodo/nocode-token-generator-dapp.git`
2. Launch and build the frontend and smart contract.

### Frontend
The `/frontend` directory has all the frontend code (written in VueJS). To setup after cloning the repo, follow the steps:
1. Switch to the frontend directory
```
cd frontend
```
2. Install all dependencies by running 
```
npm install
```
3. You can run the app with this command:
```
npm run serve
```

### Smart contract
1. Switch to the smart-contract directory
```
cd smart-contract
```
2. Install all dependencies by running 
```
npm install
```
3. Create a `.env` file in the root and add your provider API_URL and MetaMask PRIVATE_KEY
4. Compile using hardhat
```
npx hardhat compile
```
5. To deploy a contract, you can run the command below
```
npx hardhat run scripts/deployERC20.ts --network rinkeby
```
The command above deploys the `ERC20Factory.sol` contract and we use the `Rinkeby Test Network`.
After deployment, you can copy the new contract address and use the contract in your frontend

## Security
If you discover any security related issues, please email nennenwodo@gmail.com instead of using the issue tracker.

## License
MIT. Please see the [license file](https://github.com/AdoraNwodo/nocode-token-generator-dapp/blob/main/LICENSE) for more information.
