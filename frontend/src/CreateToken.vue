<template>
  <div class="create-token">
    <!--<h1 class="text-center">Balance - 0.99 ETH</h1>-->
    <br />
    <div class="container mx-auto px-4 md:px-12">
      <h4 class="placeholder" v-if="!hasError && !hasSuccess">&nbsp;</h4>
      <h4 class="error" v-if="hasError">&nbsp;{{this.errorMessage}}</h4>
      <h4 class="success" v-if="hasSuccess">{{this.successMessage}}</h4>
    </div>
    
    <div class="container mx-auto px-4 md:px-12 padding-bottom-full" >
      <div class="fade" v-if="isLoading"></div>
      <div class="loading" v-if="isLoading"></div>
      <label for="tokenname" class="block text-sm font-medium text-gray-700">Token Name*</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="text" name="tokenname" id="tokenname" v-model="name" class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <label for="tokensymbol" class="block text-sm font-medium text-gray-700">Token Symbol*</label>
      <div class="mt-1 relative rounded-md shadow-sm">
        <input type="text" name="tokensymbol" id="tokensymbol" v-model="symbol" class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <label for="tokentype" class="block text-sm font-medium text-gray-700">Token Type*</label>
      <select id="tokentype" name="tokentype" @change="changeTokenType($event)" class="block w-full pl-7 pr-12 sm:text-sm rounded-md">
        <option value="ERC20">ERC20</option>
        <option value="ERC721">ERC721</option>
        <option value="{{ERC1155}}">ERC1155</option>
      </select>

      <label for="initialsupply" class="block text-sm font-medium text-gray-700" v-if="tokenType != 'ERC721'">Initial Token Supply*</label>
      <div class="mt-1 relative rounded-md shadow-sm" v-if="tokenType != 'ERC721'">
        <input type="number" name="initialsupply" id="initialsupply" v-model="tokenSupply" class="block w-full pl-7 pr-12 sm:text-sm rounded-md" />
      </div>

      <div class="flex w-full">
        <label for="burnableToggle" class="flex cursor-pointer">
          <div class="relative">
            <input type="checkbox" id="burnableToggle" @change="checkBurnableToggle($event)" class="sr-only">
            <div class="block bg-gray-600 w-14 h-8 rounded-full"></div>
            <div class="dot absolute left-1 top-1 bg-white w-6 h-6 rounded-full transition"></div>
          </div>
          <div class="ml-3 text-gray-700 font-medium label">
            Burnable
          </div>
        </label>
      </div>

      <div class="flex w-full">
        <label for="mintableToggle" class="flex cursor-pointer">
          <div class="relative">
            <input type="checkbox" id="mintableToggle" @change="checkMintableToggle($event)" class="sr-only">
            <div class="block bg-gray-600 w-14 h-8 rounded-full"></div>
            <div class="dot absolute left-1 top-1 bg-white w-6 h-6 rounded-full transition"></div>
          </div>
          <div class="ml-3 text-gray-700 font-medium label">
            Mintable
          </div>
        </label>
      </div>

      <div class="text-center">
        <button @click="submit" >Submit</button>
      </div>
    </div>
  </div>
</template>

<script>
import {ethers} from 'ethers';
import { ERC20, ERC721, ERC1155, ERC20Address, ERC721Address } from './utils/constants';
import { erc20FactoryABI } from './abis/erc20factory';
import { erc721FactoryABI } from './abis/erc721factory';

export default {
  name: 'CreateToken',
  data() {
    return {
      isLoading: false,
      hasError: false,
      hasSuccess: false,
      errorMessage: "",
      successMessage: "",
      name: "",
      symbol: "",
      tokenSupply: 0,
      isBurnable: false,
      isMintable: false,
      tokenType: "ERC20",
      erc20: ERC20,
      erc721: ERC721,
      erc1155: ERC1155
    }
  },
  async mounted(){
    const provider = new ethers.providers.Web3Provider(window.ethereum, "any");
    if (provider != null)
    {
      this.hasEthProvider = true
    }
  },
  methods: {
    isEmpty(str){
      return (!str || str.length === 0 || str.trim() === "");
    },
    async createToken(){
      const provider = new ethers.providers.Web3Provider(window.ethereum, "any");
      await provider.send("eth_requestAccounts", []);
      const signer = provider.getSigner();

      if (this.tokenType == ERC20)
      {
        const instance = new ethers.Contract(ERC20Address, erc20FactoryABI, signer);
        const response = await instance.create(this.name, this.symbol, this.isBurnable, this.isMintable, this.tokenSupply);
        console.log(response);
      }

      if (this.tokenType == ERC721)
      {
        const instance = new ethers.Contract(ERC721Address, erc721FactoryABI, signer);
        const response = await instance.create(this.name, this.symbol, this.isBurnable, this.isMintable);
        console.log(response);
      }
    },
    async submit() { 
      this.isLoading = true;
      this.hasError = false;
      this.hasSuccess = false;
      this.errorMessage = "";
      this.successMessage = "";

      if (this.isEmpty(this.name))
      {
        this.hasError = true;
        this.errorMessage = "Token name field is empty";
      }
      else if (this.isEmpty(this.symbol))
      {
        this.hasError = true;
        this.errorMessage = "Token symbol field is empty";
      }
      else if (this.tokenType == ERC20 && this.tokenSupply <= 0)
      {
        this.hasError = true;
        this.errorMessage = "Token supply is zero or negative";
      }
      else
      { 
        try
        { 
          await this.createToken();
          this.hasSuccess = true;
          this.successMessage = `Successfully created your $${this.symbol} token`;
        }
        catch(error){
          this.hasError = true;
          this.errorMessage = error.message;
        }
      }

      this.isLoading = false;
    },
    changeTokenType(event) {
      this.tokenType = event.target.value;
    },
    checkBurnableToggle(event) {
      this.isBurnable = event.target.checked;
    },
    checkMintableToggle(event) {
      this.isMintable = event.target.checked;
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.create-token input, .create-token select{ 
  height: 40px;
  background: transparent;
  border: 1px #ccc solid;
}

.create-token label{ 
  margin-top: 30px;
  font-weight: bolder;
  color: #fff;
  font-size: 20px;
}

.label{ 
  color: #fff !important;
  font-weight: bolder;
}

.create-token .padding-bottom-full{ 
  padding-bottom: 100px;
}

input:checked ~ .dot {
  transform: translateX(100%);
  background-color: #fd6c9e;
}

.create-token button{ 
  background: #fd6c9e;
  padding: 15px 45px;
  font-size: 18px;
  color: white;
  border-radius: 20px;
  margin-top: 50px;
  font-weight: bolder;
}

.create-token .centered{ 
  text-align: center;
}
img.loading{
  width: 50px;
}
h4.success{
  background: green;
  color: white;
  padding: 20px 30px;
  border-radius: 15px;
}
h4.error{
  background: red;
  color: white;
  padding: 20px 30px;
  border-radius: 15px;
}
h4.placeholder{ 
padding: 20px 30px;
}
.fade {
  opacity:    0.8; 
  background: #000; 
  width:      200vh;
  height:     200vh; 
  z-index:    10;
  top:        0; 
  left:       0; 
  position:   fixed; 
  overflow: hidden;
}
.loading {
  position: absolute;
  left: 50%;
  top: 50%;
  z-index: 11;
  width: 120px;
  height: 120px;
  margin: -76px 0 0 -76px;
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #fd6c9e;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
