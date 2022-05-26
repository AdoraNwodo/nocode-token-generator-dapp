import {ethers} from 'ethers';
import { abi } from '@/abis/erc20factory';

const address = '0xEF5e78E21b3a4e9ad93bc412621418C7B2814720'
const provider = new ethers.providers.Web3Provider(window.ethereum, "any");
await provider.send("eth_requestAccounts", []);
const signer = provider.getSigner();
const erc20Instance = new ethers.Contract(address, abi, signer);

export { erc20Instance };